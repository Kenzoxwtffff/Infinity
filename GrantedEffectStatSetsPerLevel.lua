---@diagnostic disable: missing-return
---@class GrantedEffectStatSetsPerLevel : Object
GrantedEffectStatSetsPerLevel = {}

---@return GrantedEffectStatSet?
function GrantedEffectStatSetsPerLevel:getGrantedEffectStatSet()
end

---@return number
function GrantedEffectStatSetsPerLevel:getLevel()
end

---@return number
function GrantedEffectStatSetsPerLevel:getLevelReq()
end

---@return table<number, GrantedEffect>
function GrantedEffectStatSetsPerLevel:getGrantedEffects()
end
