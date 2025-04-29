---@diagnostic disable: missing-return
---@class EndgameMapContentsFile : Object
EndgameMapContentsFile = {}

---@return table<number, EndgameMapContent>
function EndgameMapContentsFile:getAll()
end

---@param address LuaInt64
---@return EndgameMapContent?
function EndgameMapContentsFile:getByAdr(address)
end

---@param index number
---@return EndgameMapContent?
function EndgameMapContentsFile:getByIndex(index)
end
