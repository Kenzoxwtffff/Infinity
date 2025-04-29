---@diagnostic disable: missing-return
---@class GrantedEffectsPerLevelsFile : Object
GrantedEffectsPerLevelsFile = {}

---@return table<number, GrantedEffectsPerLevel>
function GrantedEffectsPerLevelsFile:getAll()
end

---@param address LuaInt64
---@return GrantedEffectsPerLevel?
function GrantedEffectsPerLevelsFile:getByAdr(address)
end

---@param index number
---@return GrantedEffectsPerLevel?
function GrantedEffectsPerLevelsFile:getByIndex(index)
end
