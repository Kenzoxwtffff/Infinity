---@diagnostic disable: missing-return
---@class CurrencyExchangeFile : Object
CurrencyExchangeFile = {}

---@return table<number, CurrencyExchange>
function CurrencyExchangeFile:getAll()
end

---@param address LuaInt64
---@return CurrencyExchange?
function CurrencyExchangeFile:getByAdr(address)
end

---@param index number
---@return CurrencyExchange?
function CurrencyExchangeFile:getByIndex(index)
end
