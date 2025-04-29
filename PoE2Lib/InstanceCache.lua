local Table = require("CoreLib.Table")

local Events = require("PoE2Lib.Events")

local INSTANCE_CACHE_EXPIRATION = 30 * 60 * 1000

---@class PoE2Lib.InstanceCache
---@field LastActivity number
---@field Caches table<table, table>

---@type table<string, table<integer, PoE2Lib.InstanceCache>>
local Caches = {}

---@type PoE2Lib.InstanceCache
local ActiveCache = {
    LastActivity = 0,
    Caches = {},
}

-- Set the active cache when we enter a new world area.
Events.OnCachedWorld:register(function()
    local worldAreaId = Infinity.PoE2.getGameStateController():getInGameState():getInGameData():getCurrentWorldArea():getId()
    if Caches[worldAreaId] == nil then
        Caches[worldAreaId] = {}
    end

    local instanceId = Infinity.PoE2.getInstanceId()
    if Caches[worldAreaId][instanceId] == nil then
        Caches[worldAreaId][instanceId] = { LastActivity = 0, Caches = {} }
    end

    -- Update the activity time of the previous active cache
    ActiveCache.LastActivity = Infinity.Win32.GetTickCount()

    -- Set the new active cache
    ActiveCache = Caches[worldAreaId][instanceId]

    print("Active instance cache for world area " .. worldAreaId .. " instance " .. instanceId)
end)

-- Clear all the caches for the current instance when the instance cache needs
-- to be invalidated
Events.OnInvalidateInstanceCache:register(function()
    ActiveCache.Caches = {}
end)

-- Free instance caches that have not been used for a while.
Events.OnPulse:register(function()
    local now = Infinity.Win32.GetTickCount()
    for worldAreaId, instances in pairs(Caches) do
        for instanceId, cache in pairs(instances) do
            if cache ~= ActiveCache and now - cache.LastActivity > INSTANCE_CACHE_EXPIRATION then
                print("Freeing instance cache for world area " .. worldAreaId .. " instance " .. instanceId)
                instances[instanceId] = nil
            end
        end
    end
end)

--- Gets the cache for the specified defaults. If the cache does not exist, it
--- is created.
---
---@generic T
---@param defaults T
---@return T
local function GetCache(defaults)
    local cache = ActiveCache.Caches[defaults]
    if cache == nil then
        cache = Table.Copy(defaults)
        ActiveCache.Caches[defaults] = cache
    end
    return cache
end

--- Creates a new instance cache.
---
--- Example:
--- ```lua
--- local Cache = InstanceCache {
---     ---@type Vector3[]
---     Locations = {},
--- }
---
--- table.insert(Cache.Locations, Vector3(0, 0, 0))
--- ```
---
---@generic T
---@param defaults T
---@return T
return function(defaults)
    return setmetatable({}, {
        __index = function(self, key)
            return GetCache(defaults)[key]
        end,
        __newindex = function(self, key, value)
            GetCache(defaults)[key] = value
        end,
    })
end
