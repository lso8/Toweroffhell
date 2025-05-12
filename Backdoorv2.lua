local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Создаем основной GUI
local ScannerGui = Instance.new("ScreenGui")
ScannerGui.Name = "BackdoorScanner"
ScannerGui.Parent = CoreGui
ScannerGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Основной фрейм
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScannerGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 40, 60)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
MainFrame.Size = UDim2.new(0, 400, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true

-- Градиентный эффект
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 40, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 70, 90))
})
Gradient.Rotation = 45
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
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Backdoor Scan"
Title.TextColor3 = Color3.fromRGB(200, 200, 255)
Title.TextSize = 28
Title.TextStrokeTransparency = 0.5

-- Круглый индикатор состояния
local StatusCircle = Instance.new("Frame")
StatusCircle.Name = "StatusCircle"
StatusCircle.Parent = MainFrame
StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный (нет бэкдоров)
StatusCircle.Position = UDim2.new(0.85, -20, 0.1, 0)
StatusCircle.Size = UDim2.new(0, 40, 0, 40)
StatusCircle.BorderSizePixel = 0
local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = StatusCircle

-- Область вывода
local Output = Instance.new("TextLabel")
Output.Name = "Output"
Output.Parent = MainFrame
Output.BackgroundTransparency = 1
Output.Position = UDim2.new(0.1, 0, 0.2, 0)
Output.Size = UDim2.new(0.8, 0, 0.4, 0)
Output.Font = Enum.Font.Gotham
Output.Text = "No backdoors detected yet..."
Output.TextColor3 = Color3.fromRGB(180, 180, 220)
Output.TextSize = 14
Output.TextWrapped = true

-- Поле ввода require
local RequireInput = Instance.new("TextBox")
RequireInput.Name = "RequireInput"
RequireInput.Parent = MainFrame
RequireInput.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
RequireInput.Position = UDim2.new(0.1, 0, 0.7, 0)
RequireInput.Size = UDim2.new(0.5, 0, 0, 40)
RequireInput.Font = Enum.Font.Gotham
RequireInput.PlaceholderText = "Enter require ID..."
RequireInput.Text = ""
RequireInput.TextColor3 = Color3.fromRGB(200, 200, 255)
RequireInput.TextSize = 16
local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = RequireInput

-- Кнопка Execute
local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Parent = MainFrame
ExecuteButton.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
ExecuteButton.Position = UDim2.new(0.1, 0, 0.8, 0)
ExecuteButton.Size = UDim2.new(0.2, 0, 0, 40)
ExecuteButton.Font = Enum.Font.GothamBold
ExecuteButton.Text = "Execute"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextSize = 16
local ExecuteCorner = Instance.new("UICorner")
ExecuteCorner.CornerRadius = UDim.new(0, 8)
ExecuteCorner.Parent = ExecuteButton

-- Кнопка Inject
local InjectButton = Instance.new("TextButton")
InjectButton.Name = "InjectButton"
InjectButton.Parent = MainFrame
InjectButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
InjectButton.Position = UDim2.new(0.7, 0, 0.8, 0)
InjectButton.Size = UDim2.new(0.2, 0, 0, 40)
InjectButton.Font = Enum.Font.GothamBold
InjectButton.Text = "Inject"
InjectButton.TextColor3 = Color3.fromRGB(255, 255, 255)
InjectButton.TextSize = 16
local InjectCorner = Instance.new("UICorner")
InjectCorner.CornerRadius = UDim.new(0, 8)
InjectCorner.Parent = InjectButton

-- Кнопка Theme
local ThemeButton = Instance.new("TextButton")
ThemeButton.Name = "ThemeButton"
ThemeButton.Parent = MainFrame
ThemeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 150)
ThemeButton.Position = UDim2.new(0.3, 0, 0.9, 0)
ThemeButton.Size = UDim2.new(0.2, 0, 0, 40)
ThemeButton.Font = Enum.Font.GothamBold
ThemeButton.Text = "Theme"
ThemeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ThemeButton.TextSize = 16
local ThemeCorner = Instance.new("UICorner")
ThemeCorner.CornerRadius = UDim.new(0, 8)
ThemeCorner.Parent = ThemeButton

-- Кнопка Scripts
local ScriptsButton = Instance
