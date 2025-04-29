---@diagnostic disable: missing-return
---@class ModsFile : Object
ModsFile = {}

---@return Mod[]
function ModsFile:getAll()
end

---@param address LuaInt64
---@return Mod?
function ModsFile:getModByAdr(address)
end

---@param index integer
---@return Mod?
function ModsFile:getModByIndex(index)
end
