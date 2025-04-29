---@diagnostic disable: missing-return
---@class ServerInventory : Object
---@field Id number
ServerInventory = {}

---@return integer EInventoryType
function ServerInventory:getInventoryType()
end

---@return integer EInventorySlot
function ServerInventory:getInventorySlot()
end

---@return boolean
function ServerInventory:isStashTab()
end

---@return integer
function ServerInventory:getColumns()
end

---@return integer EStashTabType
function ServerInventory:getStashTabType()
end

---@return integer
function ServerInventory:getRows()
end

---@return integer
function ServerInventory:getAccessCount()
end

---@return table<integer, ItemActor>
function ServerInventory:getInventoryItems()
end

---@param id integer
---@return ItemActor?
function ServerInventory:getInventoryItemById(id)
end

---@param invPos Vector2
---@return ItemActor?
function ServerInventory:getInventoryItemByPos(invPos)
end

---@param metaPath string
---@return ItemActor?
function ServerInventory:getInventoryItemByMetaPath(metaPath)
end

---@param subString string
---@return ItemActor?
function ServerInventory:getInventoryItemByMetaPathSubString(subString)
end

---@param size Vector2
---@return boolean
function ServerInventory:canFitItemBySize(size)
end

---@param item ItemActor
---@return boolean
function ServerInventory:canFitItem(item)
end

---@return boolean
function ServerInventory:isCurrentlyLiveInventory()
end

---@param item ItemActor
---@param targetInventory ServerInventory
---@param targetPos Vector2?
---@return boolean
function ServerInventory:transferItem(item, targetInventory, targetPos)
end
