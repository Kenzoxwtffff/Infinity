---@diagnostic disable: missing-return
---@class Essence : Object
Essence = {}

--[[
	cUserdata.set_function(XOR("getId"), &Essence::GetId);
	cUserdata.set_function(XOR("getHash32"), &Essence::GetHash32);
	cUserdata.set_function(XOR("getBaseItemType"), &Essence::GetBaseItemType);
	cUserdata.set_function(XOR("getStat"), &Essence::GetStat);
	cUserdata.set_function(XOR("getMod"), &Essence::GetMod);
	cUserdata.set_function(XOR("getTag"), &Essence::GetTag);
]]

---@return integer
function Essence:getId()
end

---@return integer
function Essence:getHash32()
end

---@return BaseItemType
function Essence:getBaseItemType()
end

---@return Stat?
function Essence:getStat()
end

---@return Mod?
function Essence:getMod()
end

---@return Tag?
function Essence:getTag()
end
