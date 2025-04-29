---@diagnostic disable: missing-return
---@class IGUIMap : UIElement
IGUIMap = {}

---@return IGUIMap_SubMap
function IGUIMap:getLargeMap()
end

---@return IGUIMap_SubMap
function IGUIMap:getSmallMap()
end

---@return table<integer, MinimapIconWrapper>
function IGUIMap:getMinimapIcons()
end
