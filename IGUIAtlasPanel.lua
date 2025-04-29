---@diagnostic disable: missing-return
---@class IGUIAtlasPanel : UIElement
IGUIAtlasPanel = {}

---@return IGUIAtlasNode
function IGUIAtlasPanel:getHoveredAtlasNode()
end

---@return IGUIAtlasNode
function IGUIAtlasPanel:getActiveAtlasNode()
end

---@return table<integer, IGUIAtlasNode>
function IGUIAtlasPanel:getAtlasNodes()
end

---@return integer
function IGUIAtlasPanel:getAtlasNodeCount()
end

---@param adr LuaInt64
---@return IGUIAtlasNode
function IGUIAtlasPanel:getAtlasNodeByAdr(adr)
end

---@param index integer
---@return IGUIAtlasNode
function IGUIAtlasPanel:getAtlasNodeByIndex(index)
end

---@param location Vector2
---@return IGUIAtlasNode
function IGUIAtlasPanel:getAtlasNodeByLocation(location)
end

---@return table<integer, table<integer, Vector2>>
function IGUIAtlasPanel:getConnections()
end

---@return Vector3
function IGUIAtlasPanel:getCameraPos()
end

---@return boolean
function IGUIAtlasPanel:loadNextTile()
end
