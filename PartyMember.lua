---@diagnostic disable: missing-return
---@class PartyMember
---@field PartyStatus number
PartyMember = {}

---@return integer
function PartyMember:getPartyStatus()
end

---@return string
function PartyMember:getAccountName()
end

---@return string
function PartyMember:getCharacterName()
end

---@return string
function PartyMember:getWorldAreaName()
end

---@return boolean
function PartyMember:canQuickTeleport()
end

function PartyMember:quickTeleport()
end

---@return boolean
function PartyMember:isInSameZone()
end
