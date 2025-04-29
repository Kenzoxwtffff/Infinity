---@diagnostic disable: missing-return
---@class CurrencyExchangeCategoriesFile : Object
CurrencyExchangeCategoriesFile = {}

---@return table<number, CurrencyExchangeCategory>
function CurrencyExchangeCategoriesFile:getAll()
end

---@param address LuaInt64
---@return CurrencyExchangeCategory?
function CurrencyExchangeCategoriesFile:getByAdr(address)
end

---@param index number
---@return CurrencyExchangeCategory?
function CurrencyExchangeCategoriesFile:getByIndex(index)
end
