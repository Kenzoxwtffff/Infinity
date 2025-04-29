---@diagnostic disable: missing-return
---@class GameStateController
GameStateController = {}

---@return boolean
function GameStateController:isInGame()
end

---@return boolean
function GameStateController:isAreaLoading()
end

---@return SelectCharacterState
function GameStateController:getSelectCharacterState()
end

---@return InGameState
function GameStateController:getInGameState()
end

---@return LoginState
function GameStateController:getLoginState()
end

---@return AreaLoadingState
function GameStateController:getAreaLoadingState()
end

---@return WaitingState
function GameStateController:getWaitingState()
end

---@return table<integer, GameState>
function GameStateController:getAllStates()
end
