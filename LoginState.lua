---@diagnostic disable: missing-return
---@class LoginState : GameState
LoginState = {}

---@return string
function LoginState:getUsername()
end

---@return UIElement
function LoginState:getLoginButton()
end

---@return UIElement
function LoginState:getPasswordTextBox()
end

---@return UIElement
function LoginState:getUsernameTextBox()
end

---@return UIElement
function LoginState:getLoginFrame()
end

---@return UIElement
function LoginState:getLoginPanel()
end

---@return UIElement?
function LoginState:getConfirmationWindow()
end

---@return string
function LoginState:getConfirmationWindowTitle()
end

---@return string
function LoginState:getConfirmationWindowMessage()
end
