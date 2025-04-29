---@diagnostic disable: missing-return
---@class ActiveSkillsFile : Object
ActiveSkillsFile = {}

---@return table<number, ActiveSkill>
function ActiveSkillsFile:getAll()
end

---@param address LuaInt64
---@return ActiveSkill?
function ActiveSkillsFile:getByAdr(address)
end

---@param index number
---@return ActiveSkill?
function ActiveSkillsFile:getByIndex(index)
end
