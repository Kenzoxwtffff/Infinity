---@diagnostic disable: missing-return
---@class GrantedEffectsFile : Object
GrantedEffectsFile = {}

---@return table<number, GrantedEffect>
function GrantedEffectsFile:getAll()
end

---@param address LuaInt64
---@return GrantedEffect?
function GrantedEffectsFile:getByAdr(address)
end

---@param index number
---@return GrantedEffect?
function GrantedEffectsFile:getByIndex(index)
end
