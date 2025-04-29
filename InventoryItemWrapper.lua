---@diagnostic disable: missing-return
---@class InventoryItemWrapper : Object
InventoryItemWrapper = {}

---@return boolean
function InventoryItemWrapper:isNull()
end

---@return Actor
function InventoryItemWrapper:getItem()
end

---@return number
function InventoryItemWrapper:getId()
end

---@return number
function InventoryItemWrapper:getPosX()
end

---@return number
function InventoryItemWrapper:getPosY()
end

---@return Vector2
function InventoryItemWrapper:getSize()
end

---@return ServerInventory
function InventoryItemWrapper:getInventory()
end

function InventoryItemWrapper:transferToMainInventory()
end

---@param stashTabId integer
function InventoryItemWrapper:transferToStashTab(stashTabId)
end

---@param direction ETransferDirection
function InventoryItemWrapper:transferMapDeviceInventory(direction)
end

---@param direction ETransferDirection
function InventoryItemWrapper:transferTowerInventory(direction)
end
