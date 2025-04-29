local SkillHandler = require("PoE2Lib.Combat.SkillHandler")

---@class PoE2Lib.Combat.SkillHandlers.WarcrySkillHandler : PoE2Lib.Combat.SkillHandler
---@overload fun(skillId: number): PoE2Lib.Combat.SkillHandlers.WarcrySkillHandler
local WarcrySkillHandler = SkillHandler:extend()

WarcrySkillHandler.shortName = "Warcry"

WarcrySkillHandler.description = [[
    This is the default handler for warcry skills.
]]

WarcrySkillHandler.settings = {
    range = 60,
    corpseRadius = 20,
    corpseRange = 60,
    canFly = true,
    castOnTarget = true,
}

---@param target WorldActor?
---@return boolean ok, string? reason
function WarcrySkillHandler:canUse(target)
    if target == nil then
        return false, "no target"
    end

    local baseOk, baseReason = self:baseCanUse(target)
    if not baseOk then
        return false, baseReason
    end

    if not self:isInRange(target, self.settings.range, true, self.settings.canFly) then
        return false, "target out of range"
    end

    return true, nil
end

--- Gets the current max distance skill can hit any target at.
---@return number Range, boolean canFly
function WarcrySkillHandler:getCurrentMaxSkillDistance()
    return self.settings.range or 0, not not self.settings.canFly
end

---@param target WorldActor?
---@param location? Vector3
function WarcrySkillHandler:use(target, location)
    if self.settings.castOnTarget then
        self:super():use(target, nil)
    else
        self:super():use(nil, location)
    end
end

function WarcrySkillHandler:getTargetableCorpsePlayerRange()
    return self.settings.range + self.settings.corpseRadius
end

function WarcrySkillHandler:getTargetableCorpseTargetRadius()
    return self.settings.corpseRadius
end

---@param target WorldActor?
function WarcrySkillHandler:shouldPreventMovement(target)
    if self:super():shouldPreventMovement(target) then
        return target ~= nil and self:isInRange(target, self.settings.range, true, self.settings.canFly)
    end

    return false
end

---@param key string
function WarcrySkillHandler:drawSettings(key)
    local function label(title, id)
        return ("%s##offensive_skill_handler_%s_%s"):format(title, id, key)
    end

    ImGui.PushItemWidth(120)
    _, self.settings.range = ImGui.InputInt(label("Range", "range"), self.settings.range)
    _, self.settings.canFly = ImGui.Checkbox(label("Can Fly", "canFly"), self.settings.canFly)
    _, self.settings.castOnTarget = ImGui.Checkbox(label("Cast on Target", "castOnTarget"), self.settings.castOnTarget)
    ImGui.PopItemWidth()
end

--- Override the baseCanUse method to modify the charge check logic
---@param target WorldActor?
---@param checks? PoE2Lib.Combat.SkillHandler.BaseCanUseChecks
---@return boolean ok, string? reason
function WarcrySkillHandler:baseCanUse(target, checks)
    if checks == nil then
        return true, nil
    end

    local skill = self:getSkillObject()
    if skill == nil then
        return true, nil
    end

    if checks.enabled ~= false then
        return true, nil
    end

    if checks.sharedAnimationExpiration ~= false then
        return true, nil
    end

    local name = self:getDisplayedName()
    if checks.displayedName ~= false then
        return true, nil
    end

    if checks.canBeUsedWithWeapon ~= false then
        return true, nil
    end

    if checks.cost ~= false then
        return true, nil
    end

    if checks.charges ~= false then
        if skill:getMaxCharges() > 0 and skill:getCharges() <= -1 then
            return false, "not enough charges"
        end
    end

    if checks.conditions ~= false then
        return true, nil
    end

    return true, nil
end

return WarcrySkillHandler

