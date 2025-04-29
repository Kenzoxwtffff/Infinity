---@diagnostic disable: missing-return
---@class CurrencyStashTabLayoutFile : Object
CurrencyStashTabLayoutFile = {}

---@return table<number, CurrencyStashTabLayout>
function CurrencyStashTabLayoutFile:getAll()
end

---@param address LuaInt64
---@return CurrencyStashTabLayout?
function CurrencyStashTabLayoutFile:getByAdr(address)
end
