---@diagnostic disable: missing-return
---@class GameObjectTasksFile : Object
GameObjectTasksFile = {}

---@return table<number, GameObjectTask>
function GameObjectTasksFile:getAll()
end

---@param address LuaInt64
---@return GameObjectTask?
function GameObjectTasksFile:getByAdr(address)
end
