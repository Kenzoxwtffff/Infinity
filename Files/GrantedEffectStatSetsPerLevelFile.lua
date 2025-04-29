---@diagnostic disable: missing-return
---@class GrantedEffectStatSetsPerLevelFile : Object
GrantedEffectStatSetsPerLevelFile = {}

---@return table<number, GrantedEffectStatSetsPerLevel>
function GrantedEffectStatSetsPerLevelFile:getAll()
end

---@param address LuaInt64
---@return GrantedEffectStatSetsPerLevel?
function GrantedEffectStatSetsPerLevelFile:getByAdr(address)
end

---@param index number
---@return GrantedEffectStatSetsPerLevel?
function GrantedEffectStatSetsPerLevelFile:getByIndex(index)
end
