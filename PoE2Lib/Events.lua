local Event = require("CoreLib.Event")
local Core_Events = require("CoreLib.Events")

---@class PoE2Lib.Events : CoreLib.Events
local Events = {}
do -- Inherit from Core_Events
    for key, event in pairs(Core_Events) do
        Events[key] = event
    end
end

Events.OnTileRecalculation = Event {
    hook = function(self)
        Infinity.Scripting.GetCurrentScript():RegisterCallback("Infinity.OnTileRecalculation", function()
            self:emit(nil)
        end)
    end,
}

Events.OnInvalidateInstanceCache = Event {
    hook = function(self)
        Infinity.Scripting.GetCurrentScript():RegisterCallback("Infinity.OnInvalidateInstanceCache", function()
            self:emit(nil)
        end)
    end,
}

do
    local prevActionTime = 0
    local wasInAction = false
    ---@type CoreLib.Event<{action: ActionWrapper?}>
    Events.OnActionChange = Event {
        hook = function(self)
            Events.OnPulse:register(function()
                local lPlayer = Infinity.PoE2.getLocalPlayer()
                if lPlayer == nil then
                    return
                end

                local action = lPlayer:getCurrentAction()
                if action == nil then
                    if wasInAction then
                        wasInAction = false
                        self:emit({ action = nil })
                    end
                    return
                end

                local startTime = action:getStartTime()
                if startTime == prevActionTime then
                    return
                end

                prevActionTime = startTime
                wasInAction = true
                self:emit({ action = action })
            end)
        end,
    }
end

---@type CoreLib.Event<{action: ActionWrapper}>
Events.OnActionExecute = Event {
    hook = function(self)
        Events.OnActionChange:register(function(data)
            if data.action == nil then
                return
            end
            self:emit(data)
        end)
    end,
}

---@type CoreLib.Event<WorldActor>
Events.OnNewActor = Event {
    hook = function(self)
        Infinity.Scripting.GetCurrentScript():RegisterCallback("Infinity.OnNewActor", function(actor)
            self:emit(actor)
        end)
    end,
}

---@type CoreLib.Event<WorldActor>
Events.OnForgetActor = Event {
    hook = function(self)
        Infinity.Scripting.GetCurrentScript():RegisterCallback("Infinity.OnForgetActor", function(actor)
            self:emit(actor)
        end)
    end,
}

---@type CoreLib.Event<{inventory: ServerInventory, item: ItemActor}>
Events.OnPlayerInventoryItemAdded = Event {
    hook = function(self)
        Infinity.Scripting.GetCurrentScript():RegisterCallback("Infinity.OnPlayerInventoryItemAdded", function(inventory, item)
            self:emit({ inventory = inventory, item = item })
        end)
    end,
}

---@type CoreLib.Event<{inventory: ServerInventory, item: ItemActor}>
Events.OnPlayerInventoryItemRemoved = Event {
    hook = function(self)
        Infinity.Scripting.GetCurrentScript():RegisterCallback("Infinity.OnPlayerInventoryItemRemoved", function(inventory, item)
            self:emit({ inventory = inventory, item = item })
        end)
    end,
}

---@type CoreLib.Event<nil>
Events.OnTeleport = Event {
    hook = function(self)
        Infinity.Scripting.GetCurrentScript():RegisterCallback("Infinity.OnTeleport", function()
            self:emit(nil)
        end)
    end,
}

return Events
