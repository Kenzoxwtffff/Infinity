---@diagnostic disable: missing-return
---@class MinimapIconsFile : Object
MinimapIconsFile = {}

---@return table<number, MinimapIcon>
function MinimapIconsFile:getAll()
end

---@param address LuaInt64
---@return MinimapIcon?
function MinimapIconsFile:getByAdr(address)
end

---@param key string
---@return MinimapIcon?
function MinimapIconsFile:getByKey(key)
end
