---@diagnostic disable: missing-return
---@class ActionTypesFile : Object
ActionTypesFile = {}

---@return table<number, ActionType>
function ActionTypesFile:getAll()
end

---@param address LuaInt64
---@return ActionType?
function ActionTypesFile:getByAdr(address)
end

---@param index number
---@return ActionType?
function ActionTypesFile:getByIndex(index)
end
