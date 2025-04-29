---@diagnostic disable: missing-return
---@class Actor : Object
Actor = {}

-------
-- Debug
-------

---@return table<integer, LuaInt64>
function Actor:getComponentsRaw()
end

---@return boolean
---@param componentType integer
function Actor:hasComponent(componentType)
end

-------
-- Actor
-------
---@return boolean
function Actor:isCurrentlyLiveObject()
end

---@return integer
function Actor:getMillisecondsSinceLastSeen()
end

---@return integer
function Actor:getObjectId()
end

---@return string
function Actor:getUniqueName()
end

-------
-- MetaFile
-------
---@return MetaFile?
function Actor:getMetaFile()
end

---@return string
function Actor:getMetaPath()
end

-------
-- Actor Types
-------
---@return table<integer>
function Actor:getActorTypes()
end

---@param actorType integer
---@return boolean
function Actor:hasActorType(actorType)
end
