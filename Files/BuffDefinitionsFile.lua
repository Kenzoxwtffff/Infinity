---@diagnostic disable: missing-return
---@class BuffDefinitionsFile : Object
BuffDefinitionsFile = {}

---@return table<number, BuffDefinition>
function BuffDefinitionsFile:getAll()
end

---@param address LuaInt64
function BuffDefinitionsFile:getByAdr(address)
end

---@param index number
function BuffDefinitionsFile:getByIndex(index)
end
