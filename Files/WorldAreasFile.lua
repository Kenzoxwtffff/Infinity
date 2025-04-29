---@diagnostic disable: missing-return
---@class WorldAreasFile : Object
WorldAreasFile = {}

---@return table<number, WorldArea>
function WorldAreasFile:getAll()
end

---@param index number
---@return WorldArea?
function WorldAreasFile:getByIndex(index)
end

---@param adr LuaInt64	
---@return WorldArea?
function WorldAreasFile:getByAdr(adr)
end
