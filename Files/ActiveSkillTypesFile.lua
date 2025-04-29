---@diagnostic disable: missing-return
---@class ActiveSkillTypesFile : Object
ActiveSkillTypesFile = {}

---@return table<number, ActiveSkillType>
function ActiveSkillTypesFile:getAll()
end

---@param address LuaInt64
---@return ActiveSkillType?
function ActiveSkillTypesFile:getByAdr(address)
end

---@param index number
---@return ActiveSkillType?
function ActiveSkillTypesFile:getByIndex(index)
end
