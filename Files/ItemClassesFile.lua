---@diagnostic disable: missing-return
---@class ItemClassesFile : Object
ItemClassesFile = {}

---@return table<number, ItemClass>
function ItemClassesFile:getAll()
end

---@param address LuaInt64
---@return ItemClass?
function ItemClassesFile:getByAdr(address)
end

---@param key string
---@return ItemClass?
function ItemClassesFile:getByKey(key)
end
