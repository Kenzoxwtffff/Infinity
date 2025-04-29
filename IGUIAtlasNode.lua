---@diagnostic disable: missing-return
---@class IGUIAtlasNode : UIElement
---@field nodeWrapperAddress LuaInt64
IGUIAtlasNode = {}

---@return Vector2
function IGUIAtlasNode:getLocation()
end

---@return WorldArea
function IGUIAtlasNode:getWorldArea()
end

---@return table<integer, IGUIAtlasNode?>
function IGUIAtlasNode:getConnections()
end

---@return integer
function IGUIAtlasNode:getTierCompleted()
end

---@return integer
function IGUIAtlasNode:getTabletSlots()
end

---@return integer
function IGUIAtlasNode:getMapId()
end

---@return table<integer, boolean>
function IGUIAtlasNode:getBitSet()
end

---@return boolean
function IGUIAtlasNode:isAttempted()
end

---@return boolean
function IGUIAtlasNode:isTraversable()
end

---@return boolean
function IGUIAtlasNode:isInProgress()
end

---@return boolean
function IGUIAtlasNode:isUnlocked()
end

---@return boolean
function IGUIAtlasNode:isCompleted()
end

---@return boolean
function IGUIAtlasNode:isFailed()
end

---@return boolean
function IGUIAtlasNode:isCitadel()
end

---@return boolean
function IGUIAtlasNode:isTower()
end

---@return boolean
function IGUIAtlasNode:isActivatedTower()
end

---@return boolean
function IGUIAtlasNode:isCorrupted()
end

---@return boolean
function IGUIAtlasNode:isCorruptedNexus()
end

---@return boolean
function IGUIAtlasNode:isMonolith()
end

---@return boolean
function IGUIAtlasNode:isStargate()
end

---@return boolean
function IGUIAtlasNode:isReliquary()
end

---@return boolean
function IGUIAtlasNode:isUnique()
end

---@return table<integer, EndgameMapContent>
function IGUIAtlasNode:getEndgameMapContent()
end

function IGUIAtlasNode:select()
end

function IGUIAtlasNode:activateMap()
end

function IGUIAtlasNode:activateTablet()
end

function IGUIAtlasNode:setCameraTo()
end
