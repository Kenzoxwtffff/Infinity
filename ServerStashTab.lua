---@diagnostic disable: missing-return
---@class ServerStashTab : Object
---@field Id number
ServerStashTab = {}

---@return string
function ServerStashTab:getName()
end

---@return number
function ServerStashTab:getPlayerInventoryId()
end

---@return ServerInventory
function ServerStashTab:getPlayerInventory()
end

---@return boolean
function ServerStashTab:isLinked()
end

---@return ImVec4
function ServerStashTab:getColor()
end

---@return integer EStashTabType
function ServerStashTab:getType()
end

---@return string
function ServerStashTab:getTypeS()
end

---@return number
function ServerStashTab:getVisibleIndex()
end

---@return number
function ServerStashTab:getParentId()
end

---@return boolean
function ServerStashTab:isAffinitiesEnabled()
end

---@return number
function ServerStashTab:getAffinitiesBitMask()
end

function ServerStashTab:requestLoadingInventory()
end
