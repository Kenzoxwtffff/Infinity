---@diagnostic disable: missing-return
---@class CurrencyExchange : Object
CurrencyExchange = {}

---@return BaseItemType
function CurrencyExchange:getBaseItemType()
end

---@return CurrencyExchangeCategory
function CurrencyExchange:getMainCategory()
end

---@return CurrencyExchangeCategory
function CurrencyExchange:getSubCategory()
end

---@return number
function CurrencyExchange:getCost()
end

---@return boolean
function CurrencyExchange:isFractionalCost()
end
