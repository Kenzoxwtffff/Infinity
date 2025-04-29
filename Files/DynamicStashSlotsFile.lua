---@diagnostic disable: missing-return
---@class DynamicStashSlotsFile : Object
DynamicStashSlotsFile = {}

---@return table<number, DynamicStashSlots>
function DynamicStashSlotsFile:getAll()
end

---@param address LuaInt64
---@return DynamicStashSlots?
function DynamicStashSlotsFile:getByAdr(address)
end
