---@diagnostic disable: missing-return
---@class ServerData : Object
local ServerData = {}

---@return string
function ServerData:getAccountName()
end

---@return integer
function ServerData:getGold()
end

---@return table<integer, ServerStashTab>
function ServerData:getStashTabs()
end

---@return table<integer, ServerStashTab>
function ServerData:getGuildStashTabs()
end

---@param inventoryId integer
---@return ServerStashTab
function ServerData:getStashTabByInventoryId(inventoryId)
end

---@param id integer
function ServerData:requestStashTabInventory(id)
end

--------------------------------------------------------------------------------
-- Inventory Cache
--------------------------------------------------------------------------------

---@param id integer
---@return ServerInventory
function ServerData.getPlayerInventory(id)
end

---@return table<number, ServerInventory>
function ServerData.getPlayerInventories()
end

---@param type integer EInventoryType
---@return ServerInventory
function ServerData.getPlayerInventoryByType(type)
end

---@param type integer EInventoryType
---@return table<number, ServerInventory>
function ServerData.getPlayerInventoriesByType(type)
end

---@param slot integer EInventorySlot
---@return ServerInventory
function ServerData.getPlayerInventoryBySlot(slot)
end

---@param id integer
---@return ServerInventory
function ServerData.getNPCInventory(id)
end

---@return table<number, ServerInventory>
function ServerData.getNPCInventories()
end

---@param stashTabId integer
---@return ServerInventory
function ServerData.getStashInventory(stashTabId)
end

---@return table<integer, ServerInventory>
function ServerData.getStashInventories()
end

---@param stashTabId integer
---@return ServerInventory
function ServerData.getGuildStashInventory(stashTabId)
end

---@return table<integer, ServerInventory>
function ServerData.getGuildInventories()
end

--------------------------------------------------------------------------------
-- Checkpoints
--------------------------------------------------------------------------------

---@return boolean
function ServerData:isCheckpointsLoaded()
end

---@return table<integer, CheckpointInformation>
function ServerData:getCheckpoints()
end

--------------------------------------------------------------------------------
-- Instanced Data
--------------------------------------------------------------------------------

---@return string
function ServerData:getLeague()
end

---@return integer
function ServerData:getInstancedState()
end

---@return table<integer, EndgameContentData>
function ServerData:getEndgameContentData()
end

---@return integer
function ServerData:getRitualTribute()
end

---@return table<integer, ItemActor>
function ServerData:getRitualTributeItems()
end

---@return integer
function ServerData:getRitualTotal()
end

---@return integer
function ServerData:getRitualCompleted()
end

---@return table<integer, RitualAltar>
function ServerData:getRitualAltars()
end

function ServerData:rerollRitual()
end

---@return boolean
function ServerData:canRerollRitual()
end

---@class BreachEntry
local BreachEntry = {}

---@return Vector3
function BreachEntry:getLocation()
end

---@return number
function BreachEntry:getRadius()
end

---@return boolean
function BreachEntry:isActive()
end

---@return integer
function BreachEntry:getState()
end

---@return table<integer, BreachEntry>
function ServerData:getBreachEntries()
end

---@return table<integer, WorldActor>
function ServerData:getExpeditonActors()
end

---@return table<integer, Vector3>
function ServerData:getExpeditonDeployedExplosivePositions()
end

---@return integer
function ServerData:getExpeditonMaxCount()
end

---@return integer
function ServerData:getExpeditonCurrentCount()
end

---@return integer
function ServerData:getExpeditonAmountLeft()
end

---@param location Vector3
---@return boolean
function ServerData:expeditonPlacement_CanPlaceAt(location)
end

---@param location Vector3
function ServerData:expeditonPlacement_PlaceExplosive(location)
end

function ServerData:expeditonPlacement_RemoveExplosive()
end

--------------------------------------------------------------------------------
-- Party Stuff
--------------------------------------------------------------------------------

---@return integer
function ServerData:getPartyId()
end

---@return string
function ServerData:getPartyLeader()
end

---@return table<integer, PartyMember>
function ServerData:getPartyMembers()
end

---@return table<integer, PartyInvite>
function ServerData:getPartyInvites()
end

function ServerData:leaveParty()
end

---@return table<integer, Friend>
function ServerData:getFriendList()
end

--------------------------------------------------------------------------------
-- Reforging Stuff
--------------------------------------------------------------------------------

function ServerData:reforge()
end

--------------------------------------------------------------------------------
-- Instilling Stuff
--------------------------------------------------------------------------------

function ServerData:instil()
end
