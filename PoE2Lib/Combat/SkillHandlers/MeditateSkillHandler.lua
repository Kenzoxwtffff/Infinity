local SkillHandler = require("PoE2Lib.Combat.SkillHandler")
local UI = require("CoreLib.UI")
local Color = require("CoreLib.Color")
local CastMethods = require("PoE2Lib.Combat.CastMethods")
local Vector = require("CoreLib.Vector")

---@class PoE2Lib.Combat.SkillHandlers.MeditateSkillHandler : PoE2Lib.Combat.SkillHandler
---@overload fun(skillId: number): PoE2Lib.Combat.SkillHandlers.MeditateSkillHandler
local MeditateSkillHandler = SkillHandler:extend()

MeditateSkillHandler.shortName = "Meditate"

MeditateSkillHandler.description = [[
    Special skill handler for Meditate skill.
]]

MeditateSkillHandler:setCanHandle(function(skill, stats, name, grantedEffectsPerLevel, grantedEffect, activeSkill, activeSkillId)
    return activeSkillId == "meditate"
end)

MeditateSkillHandler.settings = {
    isChannelingHandler = true,
    max_ChannelTime = 7000, -- milliseconds
    cancelIfEnemyNearby = true,
    cancelEnemyRange = 80,
    retryDelayAfterCancel = 3000, -- ms after enemy cancel
}

local inMeditateChannel = false
local meditateChannelStart = 0
local startingMeditateTime = 0
local nextRetryTime = 0

function MeditateSkillHandler:isCastingMeditate()
    local lp = Infinity.PoE2.getLocalPlayer()
    if not lp then return false end
    local action = lp:getCurrentAction()
    if not action then return false end
    local skill = action:getSkill()
    if not skill then return false end
    return self.skillId == skill:getSkillIdentifier()
end

function MeditateSkillHandler:isChannelingSkill()
    return true
end

function MeditateSkillHandler:canUse()
    local baseOk, baseReason = self:baseCanUse(nil)
    if not baseOk then
        return false, baseReason
    end
    return true, nil
end

function MeditateSkillHandler:use_channelingHandler()
    local lp = Infinity.PoE2.getLocalPlayer()
    if not lp then return end

    local now = Infinity.Win32.GetTickCount()

    if now < nextRetryTime then
        return
    end

    if not self:isCastingMeditate() then
        if self.settings.cancelIfEnemyNearby and self:enemyNearby(self.settings.cancelEnemyRange) then
            nextRetryTime = now + self.settings.retryDelayAfterCancel
            return
        end

        local location = lp:getLocation()
        CastMethods.Methods.StartAction(self, nil, location)
        startingMeditateTime = Infinity.Win32.GetPerformanceCounter()
        meditateChannelStart = startingMeditateTime
        inMeditateChannel = true
        return
    end

    if inMeditateChannel then
        local perfNow = Infinity.Win32.GetPerformanceCounter()
        local channelTime = perfNow - meditateChannelStart

        if channelTime > self.settings.max_ChannelTime then
            lp:stopAction()
            inMeditateChannel = false
            return
        end

        if self.settings.cancelIfEnemyNearby and self:enemyNearby(self.settings.cancelEnemyRange) then
            lp:stopAction()
            inMeditateChannel = false
            nextRetryTime = now + self.settings.retryDelayAfterCancel
            return
        end

        CastMethods.Methods.UpdateAction(self, nil, lp:getLocation())
    end
end

function MeditateSkillHandler:use_nonChannelingHandler()
    if self:isCastingMeditate() then
        return
    end

    local lp = Infinity.PoE2.getLocalPlayer()
    if not lp then return end

    local now = Infinity.Win32.GetTickCount()
    if now < nextRetryTime then
        return
    end

    if self.settings.cancelIfEnemyNearby and self:enemyNearby(self.settings.cancelEnemyRange) then
        nextRetryTime = now + self.settings.retryDelayAfterCancel
        return
    end

    local location = lp:getLocation()
    CastMethods.Methods.StartAction(self, nil, location)
    startingMeditateTime = Infinity.Win32.GetPerformanceCounter()
    meditateChannelStart = startingMeditateTime
    inMeditateChannel = true
end

function MeditateSkillHandler:use()
    if self.settings.isChannelingHandler then
        self:use_channelingHandler()
    else
        self:use_nonChannelingHandler()
    end
end

function MeditateSkillHandler:shouldPreventMovement(target)
    local now = Infinity.Win32.GetPerformanceCounter()
    if startingMeditateTime > 0 and (now - startingMeditateTime) < 300 then
        return true
    end
    return self:isCastingMeditate()
end

function MeditateSkillHandler:enemyNearby(range)
    local lp = Infinity.PoE2.getLocalPlayer()
    if not lp then return false end

    local actors = Infinity.PoE2.getActors()
    if not actors then return false end
    if type(actors) ~= "table" then
        return false
    end

    local lpLoc = lp:getLocation()

    for _, actor in ipairs(actors) do
        if actor:isAlive() and actor:isEnemy() then
            local dist = lpLoc:getDistanceXY(actor:getLocation())
            if dist and dist <= range then
                return true
            end
        end
    end

    return false
end

function MeditateSkillHandler:drawSettings(key)
    local function label(title, id)
        return ("%s##meditate_skill_handler_%s_%s"):format(title, id, key)
    end

    ImGui.PushItemWidth(120)
    _, self.settings.isChannelingHandler = ImGui.Checkbox(label("Channeling Handler", "isChannelingHandler"), self.settings.isChannelingHandler)
    _, self.settings.max_ChannelTime = ImGui.SliderInt(label("Max Channel Time (ms)", "max_ChannelTime"), self.settings.max_ChannelTime, 0, 10000)
    _, self.settings.cancelIfEnemyNearby = ImGui.Checkbox(label("Cancel if Enemy Nearby", "cancelIfEnemyNearby"), self.settings.cancelIfEnemyNearby)
    _, self.settings.cancelEnemyRange = ImGui.SliderInt(label("Cancel Enemy Range", "cancelEnemyRange"), self.settings.cancelEnemyRange, 1, 120)
    _, self.settings.retryDelayAfterCancel = ImGui.SliderInt(label("Retry Delay After Cancel (ms)", "retryDelayAfterCancel"), self.settings.retryDelayAfterCancel, 0, 10000)
    ImGui.PopItemWidth()
end

return MeditateSkillHandler
