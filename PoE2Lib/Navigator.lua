local Navigator = {}

local CoreNavigator = require("CoreLib.Navigator")

local lastMoved = 0
local MIN_INTERVAL = 30

CoreNavigator.AllowedYOffset = 9999
CoreNavigator.WaypointArrivedDistance = 10 * 10.6
CoreNavigator.DestinationArrivedDistance = 3 * 10.6

---@param destinationLocation Vector3
---@param moveInterval number? if no number is provided then caller has to handle the movement interval
function Navigator.MoveTo(destinationLocation, moveInterval)
    local destinationWorld = Infinity.PoE2.WorldTransform.LocationToWorld(destinationLocation)
    CoreNavigator.SetDestination(destinationWorld)

    if CoreNavigator.Arrived then
        return
    end

    local nextWaypointWorld = CoreNavigator.GetNextWaypoint()
    if not nextWaypointWorld then
        return
    end
    local nextWaypointLoc = Infinity.PoE2.WorldTransform.WorldToLocation(nextWaypointWorld)

    local localPlayer = Infinity.PoE2.getLocalPlayer()
    if not localPlayer then
        return
    end

    local localPlayerDestination = localPlayer:getDestination()
    if localPlayerDestination:getDistanceXY(nextWaypointLoc) < 3 then
        return
    end

    local time = Infinity.Win32.GetPerformanceCounter()

    if moveInterval and time - lastMoved < moveInterval then
        return
    end

    if time - lastMoved < MIN_INTERVAL then
        print("ERROR: MoveTo called way too soon!")
        return
    end

    lastMoved = time
    localPlayer:moveTo(nextWaypointLoc, 0x0000, 0x3)
end

---@return Vector3?
function Navigator.GetNextWaypoint()
    local wp = CoreNavigator.GetNextWaypoint()
    if not wp then
        return nil
    end

    return Infinity.PoE2.WorldTransform.WorldToLocation(wp)
end

return Navigator
