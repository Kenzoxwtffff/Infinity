---@diagnostic disable: missing-return
---@class BaseItemTypesFile : Object
BaseItemTypesFile = {}

---@return table<number, BaseItemType>
function BaseItemTypesFile:getAll()
end

---@param address LuaInt64
---@return BaseItemType?
function BaseItemTypesFile:getByAdr(address)
end

---@param metaHash number
---@return BaseItemType?
function BaseItemTypesFile:getByMetaHash(metaHash)
end

---@param hash number
---@return BaseItemType?
function BaseItemTypesFile:getByProcMetaHash(hash)
end

---@param path string
---@return BaseItemType?
function BaseItemTypesFile:getByMetaPath(path)
end
