---@diagnostic disable: missing-return
---@class SkillWrapper : Object
SkillWrapper = {}

---@return number
function SkillWrapper:getSkillUseStage()
end

---@return number
function SkillWrapper:getSkillFlag()
end

---@return number
function SkillWrapper:getSkillIdentifier()
end

---@return number
function SkillWrapper:getSkillGroup()
end

---@return number
function SkillWrapper:getSkillNo()
end

---@return GrantedEffectsPerLevel?
function SkillWrapper:getGrantedEffectsPerLevel()
end

---@return GrantedEffectStatSetsPerLevel?
function SkillWrapper:getGrantedEffectStatSetsPerLevel()
end

---@return number
function SkillWrapper:getTotalUses()
end

---@return number
function SkillWrapper:getCharges()
end

---@return number
function SkillWrapper:getMaxCharges()
end

---@return number
function SkillWrapper:getCooldown()
end

---@return number
function SkillWrapper:getCurrentCooldown()
end

---@return number
function SkillWrapper:getActiveCooldownCount()
end

---@return SkillStatWrapper
function SkillWrapper:getSkillStatWrapper()
end

---@return table<number, SupportGemWrapper>
function SkillWrapper:getSupportGemWrappers()
end

--- Check if the skill can be used with the main-hand weapon.
---@return boolean
function SkillWrapper:canBeUsedWithWeaponMainHand()
end

--- Check if the skill can be used with the off-hand weapon.
---@return boolean
function SkillWrapper:canBeUsedWithWeaponOffHand()
end

--- Check if the skill can be used with either weapon.
---@return boolean
function SkillWrapper:canBeUsedWithWeapon()
end

--- Checks if the skill is allowed to cast. It currently checks:
--- - `SkillWrapper:canBeUsedWithWeapon()`
---@return boolean
function SkillWrapper:isAllowedToCast()
end

---@return integer
function SkillWrapper:countUsedWithWeaponSet1()
end

---@return integer
function SkillWrapper:countUsedWithWeaponSet2()
end

-- This is primarily used to check whether an aura is active.
---@return boolean
function SkillWrapper:isUsedWithWeaponSet1()
end

-- This is primarily used to check whether an aura is active.
---@return boolean
function SkillWrapper:isUsedWithWeaponSet2()
end

---@return number
function SkillWrapper:getCost()
end
