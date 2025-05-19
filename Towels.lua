-- Проверка, что игра — Tower of Hell
if game.PlaceId ~= 1962086868 then -- PlaceId для Tower of Hell
    return -- Скрипт не запускается в других играх
end

-- Подключение служб
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Создание ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.IgnoreGuiInset = true

-- Создание основного Frame с закругленными углами
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 400)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Средний цвет
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Закругление углов
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 20)
corner.Parent = mainFrame

-- Градиент (светлее слева, темнее справа)
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 80, 80)), -- Светлее слева
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(50, 50, 50)), -- Средний цвет
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30)) -- Темнее справа
})
gradient.Parent = mainFrame

-- Надпись сверху
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "??? Executor"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = mainFrame

-- Круглый индикатор состояния
local statusIndicator = Instance.new("Frame")
statusIndicator.Size = UDim2.new(0, 30, 0, 30)
statusIndicator.Position = UDim2.new(0, 10, 0, 60)
statusIndicator.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Зеленый (работает)
statusIndicator.BorderSizePixel = 0
statusIndicator.Parent = mainFrame

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0.5, 0) -- Полный круг
statusCorner.Parent = statusIndicator

-- Функция для изменения статуса индикатора
local function setStatus(working)
    local color = working and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    local tween = TweenService:Create(statusIndicator, TweenInfo.new(0.5), {BackgroundColor3 = color})
    tween:Play()
end

-- Пример: меняем статус для теста
setStatus(true) -- Зеленый
wait(2)
setStatus(false) -- Красный
wait(2)
setStatus(true)

-- Кнопка в том же стиле
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0, 100)
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.Text = "Execute"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextScaled = true
button.Font = Enum.Font.Gotham
button.Parent = mainFrame

-- Закругление и градиент для кнопки
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 15)
buttonCorner.Parent = button

local buttonGradient = Instance.new("UIGradient")
buttonGradient.Color = gradient.Color
buttonGradient.Parent = button

-- Анимация нажатия кнопки
button.MouseButton1Click:Connect(function()
    local tween = TweenService:Create(button, TweenInfo.new(0.1), {Size = UDim2.new(0, 190, 0, 45)})
    tween:Play()
    wait(0.1)
    tween = TweenService:Create(button, TweenInfo.new(0.1), {Size = UDim2.new(0, 200, 0, 50)})
    tween:Play()
    -- Здесь можно добавить функционал кнопки
end)

-- Перемещение Frame пальцем
local dragging, dragInput, dragStart, startPos

local function updateInput(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input == dragInput) then
        updateInput(input)
    end
end)
