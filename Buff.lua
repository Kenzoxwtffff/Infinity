---@diagnostic disable: missing-return
---@class Buff : Object
Buff = {}

---@return string
function Buff:getKey()
end

---@return string
function Buff:getDescription()
end

---@return string
function Buff:getDisplayName()
end

---@return table<integer, Stat>
function Buff:getStats()
end

---@return integer
function Buff:getTimeMax()
end

---@return number
function Buff:getTimeLeft()
end

---@return integer
function Buff:getCharges()
end

---@return integer
function Buff:getOwnerId()
end

---@return integer
function Buff:getAssociatedSkillId()
end

---@return integer
function Buff:getBuffType()
end
