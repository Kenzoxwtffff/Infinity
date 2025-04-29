---@diagnostic disable: missing-return
---@class InventoriesFile : Object
InventoriesFile = {}

---@return table<number, Inventory>
function InventoriesFile:getAll()
end

---@param address LuaInt64
---@return Inventory?
function InventoriesFile:getByAdr(address)
end

---@param index number
---@return Inventory?
function InventoriesFile:getByIndex(index)
end
