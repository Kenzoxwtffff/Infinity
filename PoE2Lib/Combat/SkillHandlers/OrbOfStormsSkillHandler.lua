local UI = require("CoreLib.UI")
local Render = require("CoreLib.Render")
local SkillHandler = require("PoE2Lib.Combat.SkillHandler")
local SkillStats = require("PoE2Lib.Combat.SkillStats")

-- local ORB_OF_STORMS_AO = "Metadata/Effects/Spells/storm_cloud/rig.ao"
local ORB_OF_STORMS_AO = "Metadata/Effects/Spells/storm_cloud/aoe_marker.ao"

---@class PoE2Lib.Combat.SkillHandlers.OrbOfStormsSkillHandler : PoE2Lib.Combat.SkillHandler
---@overload fun(skillId: number): PoE2Lib.Combat.SkillHandlers.OrbOfStormsSkillHandler
local OrbOfStormsSkillHandler = SkillHandler:extend()

OrbOfStormsSkillHandler.shortName = "Orb of Storms"

OrbOfStormsSkillHandler.description = [[
    This is a skill handler for Orb of Storms. It will keep Orb of Storms active on the target.
]]

OrbOfStormsSkillHandler:setCanHandle(function(skill, stats, name, _, _, _, asid)
    return asid == "orb_of_storms"
end)

OrbOfStormsSkillHandler.settings = {
    range = 80,
    orbRadius = 30,
    orbRadiusAuto = true,
    canFly = false,
    castOnSelf = false,
    drawOrbs = false,
}

function OrbOfStormsSkillHandler:onPulse()
    if self.settings.orbRadiusAuto then
        self.settings.orbRadius = self:getStat(SkillStats.ActiveSkillSecondaryAoERadius)
    end
end

---@type WorldActor?
OrbOfStormsSkillHandler.lastOrb = nil

---@type number
OrbOfStormsSkillHandler.lastOrbFrame = 0

---@param target WorldActor
---@return WorldActor?
function OrbOfStormsSkillHandler:findOrbOfStorms(target)
    local now = Infinity.Win32.GetFrameCount()
    if now ~= self.lastOrbFrame then
        self.lastOrb = self:findOrbOfStormsUncached(target)
        self.lastOrbFrame = now
    end
    return self.lastOrb
end

---@param target WorldActor
---@return WorldActor?
function OrbOfStormsSkillHandler:findOrbOfStormsUncached(target)
    for _, orb in pairs(Infinity.PoE2.getActorsByType(EActorType_LimitedLifespan)) do
        if orb:getAnimatedMetaPath() == ORB_OF_STORMS_AO and orb:getLocation():getDistanceXY(target:getLocation()) <= self.settings.orbRadius then
            return orb
        end
    end
    return nil
end

---@param target? WorldActor
---@return boolean ok, string? reason
function OrbOfStormsSkillHandler:canUse(target)
    local baseOk, baseReason = self:baseCanUse(target)
    if not baseOk then
        return false, baseReason
    end
    if not self.settings.castOnSelf then
        if target == nil then
            return false, "no target"
        end
        if not self:isInRange(target, self.settings.range, true, self.settings.canFly) then
            return false, "target out of range"
        end
        if self:findOrbOfStorms(target) ~= nil then
            return false, "orb already active"
        end
    else
        -- Handle player-specific checks
        local player = Infinity.PoE2.getLocalPlayer()
        if not player then
            return false, "player actor not found"
        end

        if self:findOrbOfStorms(player) ~= nil then
            return false, "orb already active at player location"
        end
    end

    return true, nil
end

--- If castonSelf is true, target is ignored and location is used instead.
---@param target? WorldActor
---@param location? Vector3
function OrbOfStormsSkillHandler:use(target, location)
    if self.settings.castOnSelf then
        local player = Infinity.PoE2.getLocalPlayer()
        if not player then
            return
        end
        self:super():use(nil, player:getLocation())
        return
    end
    self:super():use(target, location)
end

--- Gets the current max distance skill can hit any target at.
---@return number Range, boolean canFly
function OrbOfStormsSkillHandler:getCurrentMaxSkillDistance()
    return self.settings.range or 0, self.settings.canFly
end

---@param key string
function OrbOfStormsSkillHandler:drawSettings(key)
    local function label(title, id)
        return ("%s##orb_of_storms_skill_handler_%s_%s"):format(title, id, key)
    end

    ImGui.PushItemWidth(120)
    _, self.settings.range = ImGui.InputInt(label("Range", "range"), self.settings.range)
    UI.WithDisable(self.settings.orbRadiusAuto, function()
        _, self.settings.orbRadius = ImGui.InputInt(label("Orb Radius", "orb_radius"), self.settings.orbRadius)
        UI.Tooltip("The radius around the target to check for orbs. This should be the orb radius of your Orb of Storms skill. (1 meters = 10 range)")
    end)
    ImGui.SameLine()
    _, self.settings.orbRadiusAuto = ImGui.Checkbox(label("Auto", "orbRadiusAuto"), self.settings.orbRadiusAuto)
    _, self.settings.canFly = ImGui.Checkbox(label("Can Fly", "canFly"), self.settings.canFly)
    _, self.settings.castOnSelf = ImGui.Checkbox(label("Cast on Self", "castOnSelf"), self.settings.castOnSelf)

    _, self.settings.drawOrbs = ImGui.Checkbox(label("Draw Orbs", "drawOrbs"), self.settings.drawOrbs)
    ImGui.PopItemWidth()
end

function OrbOfStormsSkillHandler:onRenderD2D()
    if self.settings.drawOrbs then
        for _, orb in pairs(Infinity.PoE2.getActorsByType(EActorType_LimitedLifespan)) do
            if orb:getAnimatedMetaPath() == ORB_OF_STORMS_AO then
                Render.DrawWorldCircle(orb:getWorld(), self.settings.orbRadius * (250 / 23), "55FF0000", 4)
            end
        end
    end
end

return OrbOfStormsSkillHandler
