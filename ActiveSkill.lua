---@diagnostic disable: missing-return
---@class ActiveSkill : Object
ActiveSkill = {}

---@return string
function ActiveSkill:getId()
end

---@return string
function ActiveSkill:getDisplayedName()
end

---@return string
function ActiveSkill:getDescription()
end

---@return string
function ActiveSkill:getIcon()
end

---@return table<number, integer> -- EActiveSkillTargetType
function ActiveSkill:getActiveSkillTargetTypes()
end

---@return table<number, ActiveSkillType>
function ActiveSkill:getActiveSkillTypes()
end

---@return table<number, Stat>
function ActiveSkill:getInputStats()
end

---@return table<number, Stat>
function ActiveSkill:getOutputStats()
end
