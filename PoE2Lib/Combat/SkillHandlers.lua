local SkillStats = require("PoE2Lib.Combat.SkillStats")

---@class PoE2Lib.Combat.SkillHandlers
local SkillHandlers = {}

--- This is an ordered list of handler classes including short titles for
--- drawing the UI. It's logically ordered, so generic handlers appear on top.
SkillHandlers.HandlerNames = { --
    "OffensiveSkillHandler",
    "CrossbowSkillHandler",
    "CrossbowAmmoSkillHandler",
    "TravelSkillHandler",
    "PalmTravelSkillHandler",
    "SummonSkillHandler",
    "TriggeredSkillHandler",
    -- Skill specific handlers should be alphabetically sorted. Hypothetically they
    -- all have the same specificity, so this should be fine. But alphabetically
    -- sorting it makes it easier for the user to find a handler in the list.
    "AncestralWarriorTotemSkillHandler",
    "ArtilleryBallistaSkillHandler",
    "BarrageSkillHandler",
    "BlinkSkillHandler",
    "BonestormSkillHandler",
    "ChargedStaffSkillHandler",
    "ContagionSkillHandler",
    "CullTheWeakSkillHandler",
    "DarkEffigySkillHandler",
    "DetonateDeadSkillHandler",
    "ElementalSunderingSkillHandler",
    -- "ExplosiveSpearSkillHandler",
    "FireballSkillHandler",
    "FlameWallSkillHandler",
    "FreezingSalvoSkillHandler",
    "GatheringStormSkillHandler",
    "IceNovaSkillHandler",
    "KillingPalmSkillHandler",
    "LightningRodSkillHandler",
    "LightningSpearSkillHandler",
    "LightningWarpSkillHandler",
    "OrbOfStormsSkillHandler",
    "PainOfferingSkillHandler",
    "ParrySkillHandler",
    "PerfectStrikeSkillHandler",
    "PrimalStrikeSkillHandler",
    "RaiseZombieSkillHandler",
    "RakeSkillHandler",
    "ShockwaveTotemSkillHandler",
    "SnipeSkillHandler",
    "SnipersMarkSkillHandler",
    "SoulOfferingSkillHandler",
    "StormLanceSkillHandler",
    "SummonRhoaMountSkillHandler",
    "TempestBellSkillHandler",
    "TempestFlurrySkillHandler",
    "UnboundAvatarSkillHandler",
    "UnearthSkillHandler",
    "VoltaicMarkSkillHandler",
    "MeditateSkillHandler",
    -- Other stuff
    "FollowerBlinkSkillHandler",
    "DebugSpamSkillHandler",
}

do
    ---@type PoE2Lib.Combat.SkillHandler[]
    SkillHandlers.List = {}

    --- A map of table<name, handler> that we can use to deserialize configs
    --- and lookup handlers classes by their full names.
    ---@type table<string, PoE2Lib.Combat.SkillHandler>
    SkillHandlers.NameMap = {}

    ---@type table<PoE2Lib.Combat.SkillHandler, string>
    SkillHandlers.NamesByHandler = {}

    ---@type string[]
    SkillHandlers.ListLabels = {}

    for _, handlerName in ipairs(SkillHandlers.HandlerNames) do
        local handler = require("PoE2Lib.Combat.SkillHandlers." .. handlerName)
        table.insert(SkillHandlers.List, handler)
        SkillHandlers.NameMap[handlerName] = handler
        SkillHandlers.NamesByHandler[handler] = handlerName
        table.insert(SkillHandlers.ListLabels, handler.shortName)
    end
end

---@param name string
---@return PoE2Lib.Combat.SkillHandler?
function SkillHandlers.ByName(name)
    return SkillHandlers.NameMap[name]
end

--- Try to find the name of the skill handler. Only works for the classes, not
--- for instances.
---@param handlerClass PoE2Lib.Combat.SkillHandler
---@return string? name
function SkillHandlers.NameOf(handlerClass)
    return SkillHandlers.NamesByHandler[handlerClass]
end

--- Gets the default handler class for a skill based on the properties of the
--- skill.
---
--- A default handler will always be returned, so the user will get a suggested
--- handler in every case. The caller should decide whether to present it or not
--- based on the error message.
---
---@param skill SkillWrapper
---@return PoE2Lib.Combat.SkillHandler
---@return string? error
function SkillHandlers.GetDefaultSkillHandler(skill)
    if not skill then
        return SkillHandlers.NameMap.OffensiveSkillHandler, "PoE2Lib.Combat.GetDefaultHandler: Skill is nil"
    end

    local skillStatWrapper = skill:getSkillStatWrapper()
    if not skillStatWrapper then
        return SkillHandlers.NameMap.OffensiveSkillHandler, "PoE2Lib.Combat.GetDefaultHandler: Skill's SkillStatWrapper is nil"
    end

    local grantedEffectsPerLevel = skill:getGrantedEffectsPerLevel()
    if not grantedEffectsPerLevel then
        return SkillHandlers.NameMap.OffensiveSkillHandler, "PoE2Lib.Combat.GetDefaultHandler: Skill's GrantedEffectsPerLevel is nil"
    end

    local grantedEffect = grantedEffectsPerLevel:getGrantedEffect()
    if not grantedEffect then
        return SkillHandlers.NameMap.OffensiveSkillHandler, "PoE2Lib.Combat.GetDefaultHandler: Skill's GrantedEffect is nil"
    end

    local activeSkill = grantedEffect:getActiveSkill()
    if not activeSkill then
        return SkillHandlers.NameMap.OffensiveSkillHandler, "PoE2Lib.Combat.GetDefaultHandler: Skill's ActiveSkill is nil"
    end

    local displayedName = activeSkill:getDisplayedName()

    -- This is an exception case and should be checked first.
    if skillStatWrapper:hasStat(SkillStats.IsTriggered) then
        return SkillHandlers.NameMap.TriggeredSkillHandler, nil
    end

    -- We check the handler list in descending order of specificity, which is
    -- the inverse of the logical order in which we display the handlers (for
    -- the most part).
    for i = #SkillHandlers.List, 1, -1 do
        local handlerClass = SkillHandlers.List[i]
        if handlerClass.canHandle(skill, skillStatWrapper, displayedName, grantedEffectsPerLevel, grantedEffect, activeSkill, activeSkill:getId()) then
            return handlerClass, nil
        end
    end

    return SkillHandlers.NameMap.OffensiveSkillHandler, nil
end

return SkillHandlers
