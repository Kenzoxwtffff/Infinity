local UI = require("CoreLib.UI")
local SkillHandler = require("PoE2Lib.Combat.SkillHandler")
local SkillStats = require("PoE2Lib.Combat.SkillStats")
local CastMethods = require("PoE2Lib.Combat.CastMethods")
local RakeSkillHandler = require("PoE2Lib.Combat.SkillHandlers.RakeSkillHandler")

local Navigator = Infinity.PoE2.getNavigator()

local MOUNT_MINION_ACTION_ID = 0x20004E2D

---@class PoE2Lib.Combat.SkillHandlers.SummonRhoaMountSkillHandler : PoE2Lib.Combat.SkillHandler
---@overload fun(skillId: number): PoE2Lib.Combat.SkillHandlers.SummonRhoaMountSkillHandler
local SummonRhoaMountSkillHandler = SkillHandler:extend()

SummonRhoaMountSkillHandler.shortName = "Summon Rhoa Mount"

SummonRhoaMountSkillHandler.description = [[
    This is a handler for the Summon Rhoa Mount skill.
]]

SummonRhoaMountSkillHandler:setCanHandle(function(skill, stats, name, grantedEffectsPerLevel, grantedEffect, activeSkill, activeSkillId)
    return activeSkillId == "summon_rhoa_mount"
end)

SummonRhoaMountSkillHandler.settings = { --
    onlyOutOfCombat = true,
    autoDismount = true,
    autoDismountPercentage = 50,
    autoDismountOnTarget = false,
    autoDismountOnTargetRarity = ERarity_Unique,
}

SummonRhoaMountSkillHandler.lastMountingTick = 0

function SummonRhoaMountSkillHandler:onPulse()
    local action = Infinity.PoE2.getLocalPlayer():getCurrentAction()
    local skill = action and action:getSkill()
    local id = skill and skill:getSkillIdentifier()
    if id == MOUNT_MINION_ACTION_ID then
        self.lastMountingTick = Infinity.Win32.GetTickCount()
    end
end

---@param target WorldActor?
---@return boolean ok, string? reason
function SummonRhoaMountSkillHandler:canUse(target)
    if Infinity.PoE2.getGameStateController():getInGameState():getInGameData():getCurrentWorldArea():isHideout() then
        return false, "in hideout"
    end

    local baseOk, baseReason = self:baseCanUse(target, { cost = false, conditions = false, canUseWhileMounted = false })
    if not baseOk then
        return false, baseReason
    end

    -- Dismount check
    if self.settings.autoDismount then
        local rhoa = self:getRhoa()
        local player = Infinity.PoE2.getLocalPlayer()
        local perc = player:getStunThresholdCurrent() / player:getStunThresholdMax() * 100
        if perc > self.settings.autoDismountPercentage and rhoa ~= nil and not rhoa:isTargetable() then
            return true, nil
        end
    end

    if self.settings.autoDismountOnTarget and target ~= nil and target:getRarity() >= self.settings.autoDismountOnTargetRarity then
        local rhoa = self:getRhoa()
        if rhoa ~= nil and not rhoa:isTargetable() then
            return true, nil
        end
        return false, "rarity >= auto dismount rarity, already dismounted"
    end

    do -- Mount check
        local conditionsOk, conditionsReason = self:checkConditions(target)
        if not conditionsOk then
            return false, ("condition failed (%s)"):format(conditionsReason)
        end

        if self.settings.onlyOutOfCombat and target ~= nil then
            return false, "in combat"
        end

        -- Check if we need to activate the aura
        if not self:isAuraActive() then
            if self:getStat(SkillStats.SpiritReservation) > Infinity.PoE2.getLocalPlayer():getSpirit() then
                return false, "not enough spirit"
            end
            return true, nil
        end

        local rhoa = self:getRhoa()
        if rhoa == nil then
            return false, "no Rhoa mount found"
        end

        if not rhoa:isTargetable() then
            return false, "already mounted"
        end

        if not self:isInRange(rhoa, 40, true, false) then
            return false, "Rhoa mount too far away"
        end

        if not self:willNotInterruptActions() then
            return false, "would interrupt action"
        end

        if self:isDangerous(rhoa) then
            return false
        end

        return true, nil
    end
end

---@param rhoa WorldActor
function SummonRhoaMountSkillHandler:isDangerous(rhoa)
    local pLoc = Infinity.PoE2.getLocalPlayer():getLocation()
    if Navigator:isLocationInDanger(pLoc) then
        return true
    end

    local rhoaLoc = rhoa:getLocation()
    if Navigator:isLocationInDanger(rhoa:getLocation()) then
        return true
    end

    local safe = Navigator:getSafeLocationOnSegment(pLoc, rhoaLoc, 0)
    if safe.X ~= rhoaLoc.X or safe.Y ~= rhoaLoc.Y then
        return true
    end

    return false
end

---@return WorldActor?
function SummonRhoaMountSkillHandler:getRhoa()
    for _, actor in pairs(Infinity.PoE2.getLocalPlayer():getDeployedObjects()) do
        if actor:getAnimatedMetaPath() == "Metadata/Monsters/Mounts/Rhoa/RhoaMountPlayerSummoned.ao" and actor:isAlive() then
            return actor
        end
    end
    return nil
end

function SummonRhoaMountSkillHandler:willNotInterruptActions()
    local action = Infinity.PoE2.getLocalPlayer():getCurrentAction()
    local skill = action and action:getSkill()
    local id = skill and skill:getSkillIdentifier()
    return id == nil
        or id == MOUNT_MINION_ACTION_ID -- MountMinion
        or id == 0x20002909             -- Move
end

function SummonRhoaMountSkillHandler:shouldPreventMovement()
    local rhoa = self:getRhoa()
    if rhoa == nil or not rhoa:isTargetable() then
        return false
    end
    if self:isDangerous(rhoa) then
        return false
    end

    if (Infinity.Win32.GetTickCount() - self.lastUseTick) < 1000 and self.lastUseTick > self.lastExecuteTick then
        return true
    end
    local action = Infinity.PoE2.getLocalPlayer():getCurrentAction()
    local skill = action and action:getSkill()
    local id = skill and skill:getSkillIdentifier()
    return id == MOUNT_MINION_ACTION_ID
end

function SummonRhoaMountSkillHandler:isMounting()
    return Infinity.Win32.GetTickCount() - self.lastMountingTick < 200
end

function SummonRhoaMountSkillHandler:use(target, location)
    local player = Infinity.PoE2.getLocalPlayer()

    if not self:isAuraActive() then
        player:useAuraAction(self.config.skillId, true)
        return
    end

    local rhoa = self:getRhoa()
    if rhoa == nil then
        return
    end

    -- Dismount by removing the aura
    if not rhoa:isTargetable() then
        player:useAuraAction(self.config.skillId, false)
        return
    end

    if self:isMounting() then
        return
    end

    player:startAction(MOUNT_MINION_ACTION_ID, rhoa)
    player:stopAction()
    self:onUse()
end

---@param key string
function SummonRhoaMountSkillHandler:drawSettings(key)
    local function label(title, id)
        return ("%s##summon_rhoa_mount_skill_handler_%s_%s"):format(title, id, key)
    end

    UI.WithWidth(120, function()
        _, self.settings.onlyOutOfCombat = ImGui.Checkbox(label("Mount Only Out Of Combat", "only_out_of_combat"), self.settings.onlyOutOfCombat)
        UI.Tooltip("Will only mount the Rhoa when out of combat to ensure safety.")

        _, self.settings.autoDismount = ImGui.Checkbox(label("Auto Dismount at", "auto_dismount"), self.settings.autoDismount)
        UI.Tooltip("Will automatically dismount the Rhoa based on Heavy Stun percentage.")
        ImGui.SameLine()
        UI.WithDisable(not self.settings.autoDismount, function()
            _, self.settings.autoDismountPercentage = ImGui.SliderInt(label("Heavy Stun", "auto_dismount_percentage"), self.settings.autoDismountPercentage, 0, 100, "%d%%")
            UI.Tooltip("Will dismount the Rhoa when Heavy Stun percentage is above this value.")
        end)

        _, self.settings.autoDismountOnTarget = ImGui.Checkbox(label("Auto Dismount on Target Rarity >=", "auto_dismount_on_target"), self.settings.autoDismountOnTarget)
        UI.Tooltip("Will automatically dismount the Rhoa based on target rarity.")
        ImGui.SameLine()
        UI.WithDisable(not self.settings.autoDismountOnTarget, function()
            self.settings.autoDismountOnTargetRarity = UI.EnumCombo(label("", "auto_dismount_on_target_rarity"), self.settings.autoDismountOnTargetRarity, Infinity.PoE2.Enums.ERarity)
            UI.Tooltip("The rarity of the target that will trigger the auto dismount.")
        end)
    end)
end

return SummonRhoaMountSkillHandler
