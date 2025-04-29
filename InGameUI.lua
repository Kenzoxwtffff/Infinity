---@diagnostic disable: missing-return
---@class InGameUI : UIElement
local InGameUI = {}

---@param type number EInGameUIElement
---@return UIElement?
function InGameUI:getInGameUIElementByType(type)
end

---@return IGUIMap
function InGameUI:getMap()
end

---@return IGUIWorld
function InGameUI:getWorld()
end

---@return IGUIAtlasPanel
function InGameUI:getAtlasPanel()
end

---@return IGUIFavours
function InGameUI:getFavours()
end

---@return IGUICutGem_Active
function InGameUI:getCutGemActive()
end

---@return IGUICutGem_Support
function InGameUI:getCutGemSupport()
end

---@return IGUICutGem_Buff
function InGameUI:getCutGemBuff()
end

---@return IGUIReforge
function InGameUI:getReforge()
end

---@return IGUIInventory
function InGameUI:getInventory()
end

---@return IGUIInstilling
function InGameUI:getInstilling()
end

---@return IGUICurrencyExchange
function InGameUI:getCurrencyExchange()
end
