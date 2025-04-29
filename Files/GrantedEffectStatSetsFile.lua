---@diagnostic disable: missing-return
---@class GrantedEffectStatSetsFile : Object
GrantedEffectStatSetsFile = {}

---@return table<number, GrantedEffectStatSet>
function GrantedEffectStatSetsFile:getAll()
end

---@param address LuaInt64
---@return GrantedEffectStatSet?
function GrantedEffectStatSetsFile:getByAdr(address)
end

---@param index number
---@return GrantedEffectStatSet?
function GrantedEffectStatSetsFile:getByIndex(index)
end
