---@diagnostic disable: missing-return
---@class InGameData : Object
InGameData = {}

---@return LuaInt64
function InGameData:getLocalPlayerAdr()
end

---@return WorldActor?
function InGameData:getLocalPlayer_Direct()
end

---@return table<integer, Actor>
function InGameData:getActors_Direct()
end

---@return WorldData
function InGameData:getWorldData()
end

---@return WorldArea?
function InGameData:getCurrentWorldArea()
end

---@return WorldArea?
function InGameData:getPortalWorldArea()
end

---@return table<integer, integer>
function InGameData:getCurrentWorldStats()
end

---@param statId integer
function InGameData:hasCurrentWorldStat(statId)
end

---@return IGUIAtlasNode
function InGameData:getCurrentWorldAreaAtlasNode()
end