local SkillHandler = require("PoE2Lib.Combat.SkillHandler")
local UI = require("CoreLib.UI")
local Color = require("CoreLib.Color")

---@class PoE2Lib.Combat.SkillHandlers.BonestormSkillHandler : PoE2Lib.Combat.SkillHandler
---@overload fun(skillId: number): PoE2Lib.Combat.SkillHandlers.BonestormSkillHandler
local BonestormSkillHandler = SkillHandler:extend()

BonestormSkillHandler.shortName = "Bonestorm"

BonestormSkillHandler.description = [[
    This is special skill handler for the Bonestorm skill.
]]

BonestormSkillHandler:setCanHandle(function(skill, stats, name, grantedEffectsPerLevel, grantedEffect, activeSkill,
    activeSkillId)
    return activeSkillId == "bone_spike"
end)

BonestormSkillHandler.settings = {
    range = 60,
    canFly = true,
    isChannelingHandler = false,
    closeMonster_ChannelTime = 1100,
    max_ChannelTime = 2000,
}

function BonestormSkillHandler:isCastingBoneStorm()
    local lp = Infinity.PoE2.getLocalPlayer()

    local action = lp:getCurrentAction()
    if not action then
        return false
    end

    local skill = action:getSkill()
    if not skill then
        return false
    end

    return self.skillId == skill:getSkillIdentifier()
end

function BonestormSkillHandler:isChannelingSkill()
    return true
end

local inBonestormChannel = false
local bonestormChannelStart = 0

---@param target WorldActor?
---@return boolean ok, string? reason
function BonestormSkillHandler:canUse(target)
    if target == nil then
        return false, "no target"
    end

    -- Updating the channeling state here which is used by the channeling handler
    local isChanneling = self:isCastingBoneStorm()
    if isChanneling and not inBonestormChannel then
        inBonestormChannel = true
        bonestormChannelStart = Infinity.Win32.GetPerformanceCounter()
    elseif not isChanneling and inBonestormChannel then
        inBonestormChannel = false
        bonestormChannelStart = 0
    end

    -- If we currently are in Bonestorm, we can use it so we get handling
    if self:isCastingBoneStorm() then
        return self.settings.isChannelingHandler, nil
    end

    if self.settings.isChannelingHandler then
        return false, "not channeling bone storm"
    end

    local baseOk, baseReason = self:baseCanUse(target)
    if not baseOk then
        --print("BonestormSkillHandler:canUse -> baseCanUse failed", baseReason)
        return false, baseReason
    end

    if not self:isInRange(target, self.settings.range, true, self.settings.canFly) then
        --print("BonestormSkillHandler:canUse -> target out of range")
        return false, "target out of range"
    end

    return true, nil
end

---@param target? WorldActor
---@param location? Vector3
function BonestormSkillHandler:use_channelingHandler(target, location)
    if not target then
        return
    end

    if not self:isCastingBoneStorm() then
        print("Not casting Bonestorm, but in channeling handler")
        return
    end

    if inBonestormChannel then
        local lp = Infinity.PoE2.getLocalPlayer()
        -- How long are we channeling and how close is the target?
        -- Max channel time is 2 seconds, if enemies are close, we want to channel only up to 1.1 seconds.
        -- If we want to cast, we cancel the action (which will make the game cast the skill)
        local channelTime = Infinity.Win32.GetPerformanceCounter() - bonestormChannelStart
        local shouldCast = channelTime > self.settings.max_ChannelTime
        local distanceToTarget = target:getLocation():getDistanceXY(lp:getLocation())
        if not shouldCast then
            shouldCast = distanceToTarget < 40 and channelTime > self.settings.closeMonster_ChannelTime
        end

        --print("Channel time: " .. channelTime)
        --print("Distance to target: " .. distanceToTarget)

        if shouldCast then
            print("Casting Bonestorm", channelTime, distanceToTarget)
            lp:stopAction()
            return
        end

        -- We update the action destination
        print("Updating Bonestorm action")
        lp:updateAction(self.skillId, target:getLocation())

        return
    end
end

--- Starting the action twice actually ca
local lastTryCastingTime = 0

---@param target? WorldActor
---@param location? Vector3
function BonestormSkillHandler:use_nonChannelingHandler(target, location)
    if self:isCastingBoneStorm() then
        print("Already casting Bonestorm, but not in channeling handler")
        return
    end

    print("Starting Bonestorm channel")
    self:super():use(nil, location)
end

---@param target? WorldActor
---@param location? Vector3
function BonestormSkillHandler:use(target, location)
    if self.settings.isChannelingHandler then
        self:use_channelingHandler(target, location)
    else
        self:use_nonChannelingHandler(target, location)
    end
end

---@param key string
function BonestormSkillHandler:drawSettings(key)
    local function label(title, id)
        return ("%s##bonestorm_skill_handler_%s_%s"):format(title, id, key)
    end

    ImGui.PushItemWidth(120)
    _, self.settings.range = ImGui.InputInt(label("Range", "range"), self.settings.range)
    _, self.settings.canFly = ImGui.Checkbox(label("Can Fly", "canFly"), self.settings.canFly)
    _, self.settings.isChannelingHandler = ImGui.Checkbox(label("Channeling Handler", "isChannelingHandler"),
        self.settings.isChannelingHandler)

    if self.settings.isChannelingHandler then
        _, self.settings.max_ChannelTime = ImGui.SliderInt(
            label("Channel Time (ms)", "max_ChannelTime"),
            self.settings.max_ChannelTime, 0, 2500)
        _, self.settings.closeMonster_ChannelTime = ImGui.SliderInt(
            label("Channel Time If Monster Close (ms)", "closeMonster_ChannelTime"),
            self.settings.closeMonster_ChannelTime, 0, 2500)
    end


    ImGui.PopItemWidth()

    UI.Text("Please add the Bonestorm Skill with this handler twice!", Color.Yellow)
    UI.Text("Once at the top and once where you want to use the skill in your priority order.", Color.Yellow)
    UI.Text("Enable \"Channeling Handler\" in the first one and disable it in the second one.", Color.Yellow)
end

return BonestormSkillHandler
