---@diagnostic disable: missing-return
---@class StatsFile : Object
StatsFile = {}

---@return table<number, Stat>
function StatsFile:getAll()
end

---@param id number
---@return Stat?
function StatsFile:getById(id)
end

---@param key string
---@return Stat?
function StatsFile:getByKey(key)
end
