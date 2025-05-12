local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Создаем основной GUI
local ScannerGui = Instance.new("ScreenGui")
ScannerGui.Name = "MicroBackdoorScanner"
ScannerGui.Parent = CoreGui
ScannerGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Основной фрейм
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScannerGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 30, 50)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

-- Градиентный эффект
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 30, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 40, 70))
})
Gradient.Rotation = 90
Gradient.Parent = MainFrame

-- Скругленные углы
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "Micro Backdoor Scanner"
Title.TextColor3 = Color3.fromRGB(220, 220, 220)
Title.TextSize = 24
Title.TextStrokeTransparency = 0.7

-- Круглый индикатор состояния
local StatusCircle = Instance.new("Frame")
StatusCircle.Name = "StatusCircle"
StatusCircle.Parent = MainFrame
StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный (нет бэкдора)
StatusCircle.Position = UDim2.new(0.5, -15, 0.15, 0)
StatusCircle.Size = UDim2.new(0, 30, 0, 30)
StatusCircle.BorderSizePixel = 0
local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = StatusCircle

-- Область вывода
local Output = Instance.new("TextLabel")
Output.Name = "Output"
Output.Parent = MainFrame
Output.BackgroundTransparency = 1
Output.Position = UDim2.new(0.1, 0, 0.25, 0)
Output.Size = UDim2.new(0.8, 0, 0.3, 0)
Output.Font = Enum.Font.Gotham
Output.Text = "No backdoors detected yet..."
Output.TextColor3 = Color3.fromRGB(200, 200, 200)
Output.TextSize = 14
Output.TextWrapped = true

-- Поле для ввода require
local RequireInput = Instance.new("TextBox")
RequireInput.Name = "RequireInput"
RequireInput.Parent = MainFrame
RequireInput.BackgroundColor3 = Color3.fromRGB(50, 60, 80)
RequireInput.Position = UDim2.new(0.1, 0, 0.55, 0)
RequireInput.Size = UDim2.new(0.5, 0, 0, 30)
RequireInput.Font = Enum.Font.Gotham
RequireInput.PlaceholderText = "Enter require ID..."
RequireInput.Text = ""
RequireInput.TextColor3 = Color3.fromRGB(200, 200, 200)
RequireInput.TextSize = 14
local RequireInputCorner = Instance.new("UICorner")
RequireInputCorner.CornerRadius = UDim.new(0, 8)
RequireInputCorner.Parent = RequireInput

-- Кнопка Scan
local ScanButton = Instance.new("TextButton")
ScanButton.Name = "ScanButton"
ScanButton.Parent = MainFrame
ScanButton.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
ScanButton.Position = UDim2.new(0.35, 0, 0.65, 0)
ScanButton.Size = UDim2.new(0.3, 0, 0, 40)
ScanButton.Font = Enum.Font.GothamBold
ScanButton.Text = "Scan"
ScanButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ScanButton.TextSize = 18
local ScanCorner = Instance.new("UICorner")
ScanCorner.CornerRadius = UDim.new(0, 8)
ScanCorner.Parent = ScanButton

-- Кнопка Polaria
local PolariaButton = Instance.new("TextButton")
PolariaButton.Name = "PolariaButton"
PolariaButton.Parent = MainFrame
PolariaButton.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
PolariaButton.Position = UDim2.new(0.65, 0, 0.55, 0)
PolariaButton.Size = UDim2.new(0.25, 0, 0, 30)
PolariaButton.Font = Enum.Font.GothamBold
PolariaButton.Text = "Polaria"
PolariaButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PolariaButton.TextSize = 14
local PolariaCorner = Instance.new("UICorner")
PolariaCorner.CornerRadius = UDim.new(0, 8)
PolariaCorner.Parent = PolariaButton

-- Подпись
local Credit = Instance.new("TextLabel")
Credit.Name = "Credit"
Credit.Parent = MainFrame
Credit.BackgroundTransparency = 1
Credit.Position = UDim2.new(0.75, -50, 0.9, 0)
Credit.Size = UDim2.new(0.5, 0, 0, 20)
Credit.Font = Enum.Font.Gotham
Credit.Text = "by: xAI"
Credit.TextColor3 = Color3.fromRGB(150, 150, 150)
Credit.TextSize = 14
Credit.TextStrokeTransparency = 0.9

-- Анимация кнопок
local function tweenButton(button, scale)
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(button, tweenInfo, {Size = scale})
    tween:Play()
end

ScanButton.MouseEnter:Connect(function()
    tweenButton(ScanButton, UDim2.new(0.32, 0, 0, 42))
end)
ScanButton.MouseLeave:Connect(function()
    tweenButton(ScanButton, UDim2.new(0.3, 0, 0, 40))
end)

PolariaButton.MouseEnter:Connect(function()
    tweenButton(PolariaButton, UDim2.new(0.27, 0, 0, 32))
end)
PolariaButton.MouseLeave:Connect(function()
    tweenButton(PolariaButton, UDim2.new(0.25, 0, 0, 30))
end)

-- Функция сканирования бэкдоров
local function scanForBackdoors()
    StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 0) -- Желтый (загрузка)
    Output.Text = "Scanning for backdoors..."
    wait(2) -- Эмуляция сканирования

    local backdoorsFound = false
    local backdoorOutput = ""

    for _, instance in pairs(game:GetDescendants()) do
        if instance:IsA("LocalScript") or instance:IsA("ModuleScript") then
            local success, source = pcall(function()
                return instance.Source
            end)
            if success and source then
                if string.find(source, "require") or string.find(source, "getfenv") or string.find(source, "loadstring") then
                    backdoorsFound = true
                    backdoorOutput = backdoorOutput .. "Backdoor found in: " .. instance:GetFullName() .. "\n"
                end
            end
        end
    end

    if backdoorsFound then
        StatusCircle.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Зеленый (бэкдор активирован)
        Output.Text = backdoorOutput .. "Backdoor detected! Use require to exploit."
    else
        StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный (нет бэкдора)
        Output.Text = "No backdoors detected."
    end
end

-- Логика кнопки Scan
ScanButton.MouseButton1Click:Connect(function()
    scanForBackdoors()
end)

-- Логика кнопки Polaria с ником пользователя
PolariaButton.MouseButton1Click:Connect(function()
    local playerName = LocalPlayer.Name
    RequireInput.Text = "require(1234567890) -- Polaria (by " .. playerName .. ")"
end)

-- Логика выполнения require
RequireInput.FocusLost:Connect(function(enterPressed)
    if enterPressed and RequireInput.Text ~= "" then
        local success, result = pcall(function()
            local func = loadstring(RequireInput.Text)
            return func()
        end)
        if success then
            Output.Text = "Require executed successfully!"
            StatusCircle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        else
            Output.Text = "Failed to execute require: " .. tostring(result)
            StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        end
    end
end)
