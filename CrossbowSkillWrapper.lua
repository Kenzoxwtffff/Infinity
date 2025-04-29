---@diagnostic disable: missing-return
---@class CrossbowSkillWrapper : Object
---@field SkillId integer
CrossbowSkillWrapper = {}

---@return integer
function CrossbowSkillWrapper:getCurrentAmmo()
end

---@return integer
function CrossbowSkillWrapper:getMaxAmmo()
end

---@return SkillWrapper
function CrossbowSkillWrapper:getReloadSkill()
end

---@return SkillWrapper
function CrossbowSkillWrapper:getShootSkill()
end

--- Get the remaining recoil time in seconds.
---@return number
function CrossbowSkillWrapper:getRecoilTimeRemaining()
end
