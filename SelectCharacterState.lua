---@diagnostic disable: missing-return
---@class SelectCharacterState : GameState
SelectCharacterState = {}


---@return UIElement?
function SelectCharacterState:getPanel()
end

---@param index integer
---@return UIElement?
function SelectCharacterState:getCharacterEnterPanel(index)
end

---@param index integer
function SelectCharacterState:selectCharacter(index)
end
