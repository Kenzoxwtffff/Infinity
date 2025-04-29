---@diagnostic disable: missing-return
---@class POE2Navigator
POE2Navigator = {}


---@param endLocation Vector3
---@param radius number
---@return boolean
---@overload fun(self, endLocation: Vector2):boolean
function POE2Navigator:isLocationReachable(endLocation, radius)
end

-- function POE2Navigator:forceClearTempObstacles()
-- end

---@param startX number
---@param startY number
---@param maxRange number
---@return Vector3
function POE2Navigator:getClosestWalkableCellLocation(startX, startY, maxRange)
end

---@param startX number
---@param startY number
---@param maxRange number
---@return Vector3
function POE2Navigator:getClosestWalkableCellLocationAccurate(startX, startY, maxRange)
end

---@param cell Vector3
---@return number
function POE2Navigator:getRealDistanceToCellFromPlayer(cell)
end

---@param cell Vector3
---@return number
function POE2Navigator:getRealDistanceToCellFromPlayer_Quick(cell)
end

---@param pos Vector3
---@return number
function POE2Navigator:getRealDistanceToWorldPosFromPlayer(pos)
end

---@param startCell Vector3
---@param endCell Vector3
---@param costLimit? number
---@return number
function POE2Navigator:getRealDistanceBetweenTwoCells(startCell, endCell, costLimit)
end

---@param pos Vector3
---@return number
function POE2Navigator:getRealDistanceToWorldPosFromPlayer_Quick(pos)
end

---@param x number
---@param y number
---@param flyable boolean
---@return number
function POE2Navigator:getCellValue(x, y, flyable)
end

---@param x number
---@param y number
---@param flyable boolean
---@return boolean
function POE2Navigator:isWalkable(x, y, flyable)
end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param oneDirection boolean
---@param blockRecalculation? boolean
function POE2Navigator:addOffmeshConnection(x1, y1, x2, y2, oneDirection, blockRecalculation)
end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param blockRecalculation? boolean
function POE2Navigator:removeOffmeshConnection(x1, y1, x2, y2, blockRecalculation)
end

function POE2Navigator:clearOffmeshConnections()
end

function POE2Navigator:forceRecalculateReachability()
end

function POE2Navigator:recalcNavMesh()
end

---@param state boolean
function POE2Navigator:setEvadeMonster_White(state)
end

---@param state boolean
function POE2Navigator:setEvadeMonster_Magic(state)
end

---@param state boolean
function POE2Navigator:setEvadeMonster_Rare(state)
end

---@param state boolean
function POE2Navigator:setEvadeMonster_Unique(state)
end

---@param range number
function POE2Navigator:setEvadeMonsterDistance_White(range)
end

---@param range number
function POE2Navigator:setEvadeMonsterDistance_Magic(range)
end

---@param range number
function POE2Navigator:setEvadeMonsterDistance_Rare(range)
end

---@param range number
function POE2Navigator:setEvadeMonsterDistance_Unique(range)
end

---@param state boolean
function POE2Navigator:setEvadeMonstersPredictMovement(state)
end

---@param state boolean
function POE2Navigator:setEvadeOnDeathMonsters(state)
end

---@param state boolean
function POE2Navigator:setEvadeVolatileMonsters(state)
end

---@param state boolean
function POE2Navigator:setEvadeGroundEffects(state)
end

---@param state boolean
function POE2Navigator:setEvadeProjectiles(state)
end

---@param state boolean
function POE2Navigator:setEvadeSkills(state)
end

---@param location Vector3
---@return boolean
function POE2Navigator:isLocationInHighDanger(location)
end

---@param location Vector3
---@return boolean
function POE2Navigator:isLocationInDanger(location)
end

---@param location Vector3
---@return Vector3
function POE2Navigator:getClosestSafeLocation(location)
end

---@param location Vector3
---@param target Vector3
---@param range number? @default 100
---@param isTargetMonster boolean? @default false
---@return Vector3
function POE2Navigator:getClosestSafeLocationWithLineOfSightTo(location, target, range, isTargetMonster)
end

---@param startLocation Vector3
---@param endLocation Vector3
---@param margin number? @default 5
---@return Vector3
function POE2Navigator:getSafeLocationOnSegment(startLocation, endLocation, margin)
end

function POE2Navigator:hotReloadEvadeConfig()
end
