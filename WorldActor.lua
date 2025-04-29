---@diagnostic disable: missing-return
---@class WorldActor : Actor
WorldActor = {}

-------
-- MetaFile
-------
---@return MetaFile?
function WorldActor:getAnimatedMetaFile()
end

---@return string
function WorldActor:getAnimatedMetaPath()
end

-------
-- Actor
-------

---@return integer
function WorldActor:getActorId()
end

---@return boolean
function WorldActor:isAwakeObject()
end

---@return boolean
function WorldActor:isCurrentlyLiveObject()
end

---@return number
function WorldActor:getDistanceToPlayer()
end

---@return number
function WorldActor:getClosestEverDistance()
end

---@param location Vector3
---@param flyable boolean
---@return boolean
function WorldActor:hasLineOfSightTo(location, flyable)
end

---@param distance number
---@param checkLineOfSight boolean? (default false)
---@param flyable boolean? (default false)
---@return integer
function WorldActor:getCloseAttackableEnemyCount(distance, checkLineOfSight, flyable)
end

---@return WorldActor?
function WorldActor:getActionTarget()
end

-------
-- GameObjectTasks
-------

---@return table<integer, LuaInt64> : table<EGameObjectTask, LuaInt64>
function WorldActor:getGameObjectTasks()
end

-------
-- CrossbowManager
-------

---@return table<number, CrossbowSkillWrapper>
function WorldActor:getCrossbowSkillWrappers()
end

---@param skillId integer
---@return CrossbowSkillWrapper
function WorldActor:getCrossbowSkillWrapperBySkillId(skillId)
end

--- Returns an array the currently loaded crossbow skills.
--- The index of the array is the weapon slot that the skill is loaded for.
---@return table<number, SkillWrapper>
function WorldActor:getLoadedCrossbowSkills()
end

-------
-- Actor Component
-------

---@return ActionWrapper?
function WorldActor:getCurrentAction()
end

---@return boolean
function WorldActor:isAttacking()
end

---@return integer
function WorldActor:getStunThresholdMax()
end

---@return integer
function WorldActor:getStunThresholdCurrent()
end

---@return boolean
function WorldActor:isPrimedForStun()
end

---@return integer
function WorldActor:getActionId()
end

---@return integer
function WorldActor:getLastActionTime()
end

---@return table<number, SkillWrapper>
function WorldActor:getActiveSkills()
end

---@param skillId integer
---@return SkillWrapper
function WorldActor:getActiveSkill(skillId)
end

---@param skillId integer
---@return boolean
function WorldActor:hasActiveSkill(skillId)
end

---@return table<number, WorldActor>
function WorldActor:getDeployedObjects()
end

-------
-- Positioned Component
-------

---@return boolean
function WorldActor:isMinion()
end

---@return boolean
function WorldActor:isHostile()
end

---@return number
function WorldActor:getObjectSize()
end

---@return integer[]
function WorldActor:getStateFlag()
end

---@return boolean
function WorldActor:isFlipped()
end

---@return boolean
function WorldActor:isCollidable()
end

---@return boolean
function WorldActor:hasLockedOrientation()
end

---@return boolean
function WorldActor:hasLockedScale()
end

---@return Vector3
function WorldActor:getDestination()
end

---@return Vector3
function WorldActor:getOrigin()
end

---@return number
function WorldActor:getSpeed()
end

---@return number
function WorldActor:getMomentum()
end

---@return number
function WorldActor:getRotation()
end

---@return boolean
function WorldActor:isMoving()
end

---@return Vector3
function WorldActor:getLocation()
end

---@return Vector3
function WorldActor:getNavLocation()
end

---@return Vector3
function WorldActor:getWorld()
end

---@return Vector3
function WorldActor:getGrid()
end

-------
-- ObjectMagicProperties Component
-------

---@return integer ERarity
function WorldActor:getRarity()
end

---@return boolean
function WorldActor:isIdentified()
end

---@class ModEntry
---@field Mod Mod
---@field Values integer[]

---@return ModEntry[]
function WorldActor:getImplicitMods()
end

---@return ModEntry[]
function WorldActor:getExplicitMods()
end

---@return ModEntry[]
function WorldActor:getAllMods()
end

-------
-- Base Component
-------

---@return Vector2
function WorldActor:getItemSize()
end

---@return string
function WorldActor:getItemName()
end

---@return BaseItemType
function WorldActor:getBaseItemType()
end

---@return boolean
function WorldActor:isItemLockedToCharacter()
end

---@return boolean
function WorldActor:isItemLockedToAccount()
end

---@return boolean
function WorldActor:isItemCorrupted()
end

-------
-- Life Component
-------

---@return boolean
function WorldActor:isAlive()
end

---@return integer
function WorldActor:getTimeSinceDeath()
end

---@return integer
function WorldActor:getHp()
end

---@return integer
function WorldActor:getMaxHp()
end

---@return integer
function WorldActor:getUnreservedMaxHp()
end

---@return integer
function WorldActor:getHpPercentage()
end

---@return integer
function WorldActor:getMp()
end

---@return integer
function WorldActor:getMaxMp()
end

---@return integer
function WorldActor:getUnreservedMaxMp()
end

---@return number
function WorldActor:getMpPercentage()
end

---@return number
function WorldActor:getEs()
end

---@return number
function WorldActor:getMaxEs()
end

---@return number
function WorldActor:getEsPercentage()
end

---@return number
function WorldActor:getSpirit()
end

---@return number
function WorldActor:getMaxSpirit()
end

---@return number
function WorldActor:getSpiritPercentage()
end

---@return boolean
function WorldActor:isUseableCorpse()
end

-------
-- Chests Component
-------

---@return boolean
function WorldActor:isOpenedChest()
end

---@return boolean
function WorldActor:isLockedChest()
end

---@return boolean
function WorldActor:isStrongbox()
end

---@return boolean
function WorldActor:isDestroyAfterOpen()
end

---@return boolean
function WorldActor:isLargeChest()
end

---@return boolean
function WorldActor:isStompableChest()
end

---@return boolean
function WorldActor:isOpenOnDamage()
end

---@return boolean
function WorldActor:isOpenWhenSummonsDie()
end

---@return integer
function WorldActor:getChestLevel()
end

-------
-- Buffs Component
-------
---@return table<integer, Buff>
function WorldActor:getBuffs()
end

---@param key string
---@return boolean
function WorldActor:hasBuff(key)
end

-------
-- Stats Component
-------

---@class StatEntry
---@field Stat Stat
---@field Value integer

---@return table<integer, StatEntry>
function WorldActor:getStats()
end

---@param id integer
---@return integer
function WorldActor:getStatValue(id)
end

---@param id integer
---@return boolean
function WorldActor:hasStat(id)
end

-------
-- Monsters
-------
---@return boolean
function WorldActor:isAttackable()
end

-------
-- Skill Usage
-------

---@param skillId integer
---@param actorId integer
---@param location Vector3?
---@param flag integer? : default 0x0400
---@param flag2 integer? : default 0x00
---@overload fun(self, skillId: integer, target: Actor, flag: integer?, flag2: integer?)
---@overload fun(self, skillId: integer, location: Vector3, flag: integer?, flag2: integer?)
function WorldActor:startAction(skillId, actorId, location, flag, flag2)
end

---@param skillId integer
---@param location Vector3
---@overload fun(skillId: integer, target: Actor)
function WorldActor:updateAction(skillId, location)
end

function WorldActor:stopAction()
end

---@param location Vector3
---@param flag integer? : default 0x0400
---@param flag2 integer? : default 0x00
---@overload fun(target: Actor, flag: integer?, flag2: integer?)
function WorldActor:moveTo(location, flag, flag2)
end

---@param location Vector3
---@overload fun(target: Actor)
function WorldActor:moveToUpdate(location)
end

---@param target Actor
---@param flag integer? : default 0x0400
---@param flag2 integer? : default 0x00
function WorldActor:interact(target, flag, flag2)
end

---@param target Actor
function WorldActor:pickUp(target)
end

---@param skillId integer
---@param state integer
---@overload fun(self, skillId: integer, state: boolean)
function WorldActor:useAuraAction(skillId, state)
end

---@param skillId integer
---@param actorId integer
function WorldActor:useInstantAction(skillId, actorId)
end

---
--- Projectiles
---

---@return number
function WorldActor:getLeftoverProjectileTravelDistance()
end

---
--- Targetable
---

---@return boolean
function WorldActor:isTargetable()
end

---@return boolean
function WorldActor:isTargeted()
end

---@return boolean
function WorldActor:canBeHighlighted()
end

---@return boolean
function WorldActor:meetsQuestState()
end

---@return boolean
function WorldActor:isHiddenFromPlayer()
end

---
--- Player
---

---@return integer
function WorldActor:getAllocatedLootId()
end

---@return integer
function WorldActor:getEXP()
end

---@return integer
function WorldActor:getSTR()
end

---@return integer
function WorldActor:getDEX()
end

---@return integer
function WorldActor:getINT()
end

---@return integer
function WorldActor:getBaseSTR()
end

---@return integer
function WorldActor:getBaseDEX()
end

---@return integer
function WorldActor:getBaseINT()
end

---@return integer
function WorldActor:getLevel()
end

---@return string
function WorldActor:getPlayerName()
end

-------
-- Shrine Component
-------

---@return string
function WorldActor:getShrineName()
end

---@return string
function WorldActor:getShrineActivationText()
end

---@return string
function WorldActor:getShrineText()
end

---@return BuffDefinition
function WorldActor:getShrinePlayerBuff()
end

---@return BuffDefinition
function WorldActor:getShrineMonsterBuff()
end

-------
-- Transitionable Component
-------

---@return integer
function WorldActor:getTransitionableState()
end

------
--- AreaTransition
------

---@return WorldArea?
function WorldActor:getDestinationWorldArea()
end

---@return boolean
function WorldActor:isLocalTransition()
end

---@return boolean
function WorldActor:hasKnownLocalTransitionDestination()
end

---@return Vector3
function WorldActor:getLocalTransitionDestination()
end

-------
-- WorldItem Component
-------
---@return ItemActor?
function WorldActor:getItem()
end

---@return boolean
function WorldActor:canLoot()
end

---@return integer
function WorldActor:canLootInMs()
end

---@return integer
function WorldActor:getLootAllocationId()
end

---@return integer
function WorldActor:getLootBecomesFreeTime()
end

-------
-- TriggerableBlockage Component
-------

---@return boolean
function WorldActor:isBlockageClosed()
end

-------
-- Portal Component
-------
---@return WorldArea?
function WorldActor:getPortalDestination()
end

-------
-- Breach
-------

---@return number
function WorldActor:getTimeSinceBreachStart()
end

---@return integer
function WorldActor:getBreachRadius()
end

-------
-- Monolith
-------

---@return table<integer, Essence>
function WorldActor:getEssences()
end

---@return boolean
function WorldActor:isCorruptedMonolith()
end

---@return integer
function WorldActor:getMonolithStage()
end

---@return boolean
function WorldActor:isOpenedMonolith()
end


-------
-- NPC
-------

---@return NPC?
function WorldActor:getNPC()
end

---@param npcTalk NPCTalk
function WorldActor:startNPCTalk(npcTalk)
end