---@diagnostic disable: missing-return
---@class ItemActor : Actor
ItemActor = {}

---@return number
function ItemActor:getId()
end

---@return Vector2
function ItemActor:getInventoryPos()
end

---@return boolean
function ItemActor:isLiveItem()
end

---@return boolean
---@param serverInventory ServerInventory
function ItemActor:isInInventory(serverInventory)
end

---@return ServerInventory
function ItemActor:getInventory()
end

-------
---Tribute
-------

---@return integer
function ItemActor:getTributePrice()
end

---@return integer
function ItemActor:getTributeBasePrice()
end

---@return boolean
function ItemActor:isTributeItemUnlocked()
end

function ItemActor:buyTributeItem()
end

function ItemActor:deferTributeItem()
end

-------
---Base
-------

---@return Vector2
function ItemActor:getItemSize()
end

---@return string
function ItemActor:getItemName()
end

---@return BaseItemType?
function ItemActor:getBaseItemType()
end

---@return boolean
function ItemActor:isItemLockedToCharacter()
end

---@return boolean
function ItemActor:isItemLockedToAccount()
end

---@return boolean
function ItemActor:isItemCorrupted()
end

---@return integer
function ItemActor:getBaseItemLevel()
end

-------
---LocalStats
-------

---@return table<Stat, integer>
function ItemActor:getStatsLocal()
end

-------
---Sockets
-------

---@return table<integer, integer>
function ItemActor:getSocketGroups()
end

---@return table<integer, ItemActor>
function ItemActor:getSocketedItems()
end

-------
---Mods
-------

---@return integer ERarity
function ItemActor:getRarity()
end

---@return boolean
function ItemActor:isIdentified()
end

---@return table<integer, ModEntry>
function ItemActor:getImplicitMods()
end

---@return table<integer, ModEntry>
function ItemActor:getExplicitMods()
end

---@return table<integer, ModEntry>
function ItemActor:getEnchantMods()
end

---@return table<integer, ModEntry>
function ItemActor:getHellscapeMods()
end

---@return table<integer, ModEntry>
function ItemActor:getAllMods()
end

---@return table<Stat, integer>
function ItemActor:getCombinedStats()
end

---@return string
function ItemActor:getName()
end

---@return integer
function ItemActor:getItemLevel()
end

---@return integer
function ItemActor:getRequiredLevel()
end

---@return integer
function ItemActor:getUnidentifiedTier()
end

---@return boolean
function ItemActor:isDuplicated()
end

---@return boolean
function ItemActor:isSplit()
end

---@return boolean
function ItemActor:isDisableMirroredValues()
end

---@return boolean
function ItemActor:isRelic()
end

---@return boolean
function ItemActor:isSynthetic()
end

-------
---Charges
-------

---@return integer
function ItemActor:getCurrentCharges()
end

---@return integer
function ItemActor:getChargesPerUse()
end

---@return integer
function ItemActor:getMaxCharges()
end

-------
---Flask
-------

---@return integer EFlaskType
function ItemActor:getFlaskType()
end

-------
---Stack
-------

---@return integer
function ItemActor:getCurrentStackSize()
end

---@return integer
function ItemActor:getMaxStackSize_Inventory()
end

---@return integer
function ItemActor:getMaxStackSize_CurrencyStash()
end

---@return boolean
function ItemActor:isStackable()
end

-------
---Map
-------
---@return integer
function ItemActor:getMapTier()
end

-------
---Quality
-------
---@return integer
function ItemActor:getItemQuality()
end

-------
---RenderItem
-------

---@return string
function ItemActor:getDDSPath()
end

-------
---Toggleable
-------

---@return boolean
function ItemActor:isToggled()
end

-------
---Functions
-------

---@param target ItemActor
function ItemActor:useOn(target)
end

---@param target WorldActor
function ItemActor:useOnWorldActor(target)
end

---@param inventory ServerInventory
---@return boolean
function ItemActor:transferTo(inventory)
end

---@return boolean
function ItemActor:use()
end
