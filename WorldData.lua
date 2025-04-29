---@diagnostic disable: missing-return
---@class WorldData : Object
WorldData = {}

---@return integer
function WorldData:getTilesWidth()
end

---@return integer
function WorldData:getTilesHeight()
end

---@return table<integer, CachedTileData|nil>
function WorldData:getTiles()
end

---@param gridPosX integer
---@param gridPosY integer
---@return CachedTileData?
function WorldData:getTile(gridPosX, gridPosY)
end

--- Has to be exact
---@param metaFilePath string
---@return table<integer, CachedTileData>
function WorldData:getTilesByMetaFile(metaFilePath)
end

--- Can be any substring of the meta file path
---@param metaFilePathNeedle string
---@return table<integer, CachedTileData>
function WorldData:getTilesByMetaFileSubstring(metaFilePathNeedle)
end

---@param x integer
---@param y integer
---@param vIndex integer
---@return integer bitFlag
function WorldData:getCellBitFlag(x, y, vIndex)
end

---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
---@param layer integer @0 for ground, 1 for flyable
---@return boolean hasCollision
---@return integer collisionX
---@return integer collisionY
function WorldData:raycast(x1, y1, x2, y2, layer)
end

---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
---@param layer integer @0 for ground, 1 for flyable
---@param objectSize integer
---@return boolean hasCollision
---@return integer collisionX
---@return integer collisionY
function WorldData:conservativeRaycast(x1, y1, x2, y2, layer, objectSize)
end
