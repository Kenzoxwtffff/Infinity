local UI = require("CoreLib.UI")
local SkillHandler = require("PoE2Lib.Combat.SkillHandler")

local ORB_OF_STORMS_AO = "Metadata/Effects/Spells/storm_cloud/rig.ao"

---@class PoE2Lib.Combat.SkillHandlers.LightningRodSkillHandler : PoE2Lib.Combat.SkillHandler
---@overload fun(skillId: number): PoE2Lib.Combat.SkillHandlers.LightningRodSkillHandler
local LightningRodSkillHandler = SkillHandler:extend()

LightningRodSkillHandler.shortName = "Lightning Rod"

LightningRodSkillHandler.description = [[
    This is a skill handler for Lightning Rod. If Target Orb of Storms is
    enabled, it will target the first Orb of Storms in range of the target.
    Otherwise it functions the same as the Offensive skill handler.
]]

LightningRodSkillHandler:setCanHandle(function(skill, stats, name, _, _, _, asid)
    return asid == 'lightning_rod_rain'
end)

LightningRodSkillHandler.settings = { --
    range = 80,
    targetOrbOfStorms = false,
    orbRadius = 31,
}

---@type Vector3?
LightningRodSkillHandler.lastOrbLocation = nil

---@type number
LightningRodSkillHandler.lastOrbFrame = 0

---@param target? WorldActor
---@param location? Vector3
---@return Vector3? targetLocation
function LightningRodSkillHandler:findOrbOfStorms(target, location)
    local now = Infinity.Win32.GetFrameCount()
    if now ~= self.lastOrbFrame then
        self.lastOrbLocation = self:findOrbOfStormsUncached(target, location)
        self.lastOrbFrame = now
    end
    return self.lastOrbLocation
end

---@param target? WorldActor
---@param location? Vector3
---@return Vector3? targetLocation
function LightningRodSkillHandler:findOrbOfStormsUncached(target, location)
    location = location or (target and target:getLocation())
    if location == nil then
        return nil
    end
    for _, orb in pairs(Infinity.PoE2.getActorsByType(EActorType_LimitedLifespan)) do
        local orbLocation = orb:getLocation()
        if orb:getAnimatedMetaPath() == ORB_OF_STORMS_AO and orbLocation:getDistanceXY(location) <= self.settings.orbRadius then
            return orbLocation
        end
    end
    return nil
end

---@param target? WorldActor
---@return boolean ok, string? reason
function LightningRodSkillHandler:canUse(target)
    local baseOk, baseReason = self:baseCanUse(target)
    if not baseOk then
        return false, baseReason
    end

    if target == nil then
        return false, "no target"
    end

    if self.settings.targetOrbOfStorms then
        local orbLocation = self:findOrbOfStorms(target, nil)
        if orbLocation == nil then
            return false, "no orb"
        end
    end

    return true, nil
end

---@param target? WorldActor
---@param location? Vector3
function LightningRodSkillHandler:use(target, location)
    if self.settings.targetOrbOfStorms then
        local orbLocation = self:findOrbOfStorms(target, location)
        if orbLocation then
            self:super():use(nil, orbLocation)
        end
    else
        self:super():use(target, location)
    end
end

---@return number Range, boolean canFly
function LightningRodSkillHandler:getCurrentMaxSkillDistance()
    return self.settings.range or 0, true
end

---@param key string
function LightningRodSkillHandler:drawSettings(key)
    local function label(title, id)
        return ("%s##LightningRod_skill_handler_%s_%s"):format(title, id, key)
    end

    ImGui.PushItemWidth(120)

    _, self.settings.range = ImGui.InputInt(label("Range", "range"), self.settings.range)
    _, self.settings.targetOrbOfStorms = ImGui.Checkbox(label("Target Orb of Storms", "target_orb_of_storms"), self.settings.targetOrbOfStorms)
    UI.WithDisable(not self.settings.targetOrbOfStorms, function()
        ImGui.Indent()
        _, self.settings.orbRadius = ImGui.InputInt(label("Orb Radius", "orb_radius"), self.settings.orbRadius)
        ImGui.Unindent()
    end)

    ImGui.PopItemWidth()
end

return LightningRodSkillHandler
