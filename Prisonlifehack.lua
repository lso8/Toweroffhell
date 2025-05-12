local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Создаем основной GUI
local MainGui = Instance.new("ScreenGui")
MainGui.Name = "PrisonLifeHack"
MainGui.Parent = CoreGui
MainGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Основной фрейм
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = MainGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 30, 50)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

-- Градиент
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 30, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 60, 80))
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
Title.Text = "Prison Life Hack v2"
Title.TextColor3 = Color3.fromRGB(200, 200, 255)
Title.TextSize = 24
Title.TextStrokeTransparency = 0.6

-- Кнопка Neutral
local NeutralButton = Instance.new("TextButton")
NeutralButton.Name = "NeutralButton"
NeutralButton.Parent = MainFrame
NeutralButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
NeutralButton.Position = UDim2.new(0.2, 0, 0.3, 0)
NeutralButton.Size = UDim2.new(0.25, 0, 0, 50)
NeutralButton.Font = Enum.Font.GothamBold
NeutralButton.Text = "Neutral"
NeutralButton.TextColor3 = Color3.fromRGB(255, 255, 255)
NeutralButton.TextSize = 18
local NeutralCorner = Instance.new("UICorner")
NeutralCorner.CornerRadius = UDim.new(0, 10)
NeutralCorner.Parent = NeutralButton

-- Кнопка Doof
local DoofButton = Instance.new("TextButton")
DoofButton.Name = "DoofButton"
DoofButton.Parent = MainFrame
DoofButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
DoofButton.Position = UDim2.new(0.55, 0, 0.3, 0)
DoofButton.Size = UDim2.new(0.25, 0, 0, 50)
DoofButton.Font = Enum.Font.GothamBold
DoofButton.Text = "Doof"
DoofButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DoofButton.TextSize = 18
local DoofCorner = Instance.new("UICorner")
DoofCorner.CornerRadius = UDim.new(0, 10)
DoofCorner.Parent = DoofButton

-- Индикатор состояния
local StatusCircle = Instance.new("Frame")
StatusCircle.Name = "StatusCircle"
StatusCircle.Parent = MainFrame
StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный (не сработало)
StatusCircle.Position = UDim2.new(0.75, -20, 0.3, 0)
StatusCircle.Size = UDim2.new(0, 40, 0, 40)
StatusCircle.BorderSizePixel = 0
local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1, 0)
CircleCorner.Parent = StatusCircle

-- Надпись Free Pass
local FreePass = Instance.new("TextLabel")
FreePass.Name = "FreePass"
FreePass.Parent = MainFrame
FreePass.BackgroundTransparency = 1
FreePass.Position = UDim2.new(0.1, 0, 0.7, 0)
FreePass.Size = UDim2.new(0.3, 0, 0, 30)
FreePass.Font = Enum.Font.Gotham
FreePass.Text = "Free Pass"
FreePass.TextColor3 = Color3.fromRGB(255, 215, 0)
FreePass.TextSize = 20
FreePass.TextStrokeTransparency = 0.7

-- Кнопка Execute
local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Parent = MainFrame
ExecuteButton.BackgroundColor3 = Color3.fromRGB(100, 100, 150)
ExecuteButton.Position = UDim2.new(0.2, 0, 0.5, 0)
ExecuteButton.Size = UDim2.new(0.25, 0, 0, 50)
ExecuteButton.Font = Enum.Font.GothamBold
ExecuteButton.Text = "Execute"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextSize = 18
local ExecuteCorner = Instance.new("UICorner")
ExecuteCorner.CornerRadius = UDim.new(0, 10)
ExecuteCorner.Parent = ExecuteButton

-- Сворачиваемая иконка
local MinimizeIcon = Instance.new("Frame")
MinimizeIcon.Name = "MinimizeIcon"
MinimizeIcon.Parent = MainGui
MinimizeIcon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MinimizeIcon.Position = UDim2.new(0.1, 10, 0.1, 10)
MinimizeIcon.Size = UDim2.new(0, 50, 0, 50)
MinimizeIcon.Visible = false
MinimizeIcon.Active = true
MinimizeIcon.Draggable = true
local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(0, 10)
IconCorner.Parent = MinimizeIcon

local IconText = Instance.new("TextLabel")
IconText.Name = "IconText"
IconText.Parent = MinimizeIcon
IconText.BackgroundTransparency = 1
IconText.Size = UDim2.new(1, 0, 1, 0)
IconText.Font = Enum.Font.GothamBold
IconText.Text = "⚙"
IconText.TextColor3 = Color3.fromRGB(255, 255, 255)
IconText.TextSize = 24

-- Кнопка сворачивания
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = MainFrame
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.Position = UDim2.new(0.9, -40, 0.05, 0)
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 18
local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 8)
MinCorner.Parent = MinimizeButton

-- Второе GUI для Execute
local ExecuteGui = Instance.new("Frame")
ExecuteGui.Name = "ExecuteGui"
ExecuteGui.Parent = MainGui
ExecuteGui.BackgroundColor3 = Color3.fromRGB(25, 35, 55)
ExecuteGui.BorderSizePixel = 0
ExecuteGui.Position = UDim2.new(0.5, -200, 0.5, -150)
ExecuteGui.Size = UDim2.new(0, 400, 0, 300)
ExecuteGui.Visible = false
ExecuteGui.Active = true
ExecuteGui.Draggable = true
local ExecGradient = Instance.new("UIGradient")
ExecGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 35, 55)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 65, 85))
})
ExecGradient.Rotation = 90
ExecGradient.Parent = ExecuteGui
local ExecCorner = Instance.new("UICorner")
ExecCorner.CornerRadius = UDim.new(0, 15)
ExecCorner.Parent = ExecuteGui

local ExecTitle = Instance.new("TextLabel")
ExecTitle.Name = "ExecTitle"
ExecTitle.Parent = ExecuteGui
ExecTitle.BackgroundTransparency = 1
ExecTitle.Size = UDim2.new(1, 0, 0, 40)
ExecTitle.Font = Enum.Font.GothamBold
ExecTitle.Text = "Execute Panel"
ExecTitle.TextColor3 = Color3.fromRGB(200, 200, 255)
ExecTitle.TextSize = 24
ExecTitle.TextStrokeTransparency = 0.6

local ExecInput = Instance.new("TextBox")
ExecInput.Name = "ExecInput"
ExecInput.Parent = ExecuteGui
ExecInput.BackgroundColor3 = Color3.fromRGB(40, 50, 70)
ExecInput.Position = UDim2.new(0.1, 0, 0.3, 0)
ExecInput.Size = UDim2.new(0.8, 0, 0, 50)
ExecInput.Font = Enum.Font.Gotham
ExecInput.PlaceholderText = "Enter loadstring..."
ExecInput.Text = ""
ExecInput.TextColor3 = Color3.fromRGB(200, 200, 255)
ExecInput.TextSize = 16
local ExecInputCorner = Instance.new("UICorner")
ExecInputCorner.CornerRadius = UDim.new(0, 8)
ExecInputCorner.Parent = ExecInput

local ExecExecuteButton = Instance.new("TextButton")
ExecExecuteButton.Name = "ExecExecuteButton"
ExecExecuteButton.Parent = ExecuteGui
ExecExecuteButton.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
ExecExecuteButton.Position = UDim2.new(0.2, 0, 0.6, 0)
ExecExecuteButton.Size = UDim2.new(0.25, 0, 0, 50)
ExecExecuteButton.Font = Enum.Font.GothamBold
ExecExecuteButton.Text = "Execute"
ExecExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecExecuteButton.TextSize = 18
local ExecExecCorner = Instance.new("UICorner")
ExecExecCorner.CornerRadius = UDim.new(0, 10)
ExecExecCorner.Parent = ExecExecuteButton

local FileButton = Instance.new("TextButton")
FileButton.Name = "FileButton"
FileButton.Parent = ExecuteGui
FileButton.BackgroundColor3 = Color3.fromRGB(100, 50, 100)
FileButton.Position = UDim2.new(0.5, 0, 0.6, 0)
FileButton.Size = UDim2.new(0.25, 0, 0, 50)
FileButton.Font = Enum.Font.GothamBold
FileButton.Text = "File"
FileButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FileButton.TextSize = 18
local FileCorner = Instance.new("UICorner")
FileCorner.CornerRadius = UDim.new(0, 10)
FileCorner.Parent = FileButton

-- Анимация кнопок
local function tweenButton(button, scale)
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(button, tweenInfo, {Size = scale})
    tween:Play()
end

NeutralButton.MouseEnter:Connect(function() tweenButton(NeutralButton, UDim2.new(0.27, 0, 0, 52)) end)
NeutralButton.MouseLeave:Connect(function() tweenButton(NeutralButton, UDim2.new(0.25, 0, 0, 50)) end)

DoofButton.MouseEnter:Connect(function() tweenButton(DoofButton, UDim2.new(0.27, 0, 0, 52)) end)
DoofButton.MouseLeave:Connect(function() tweenButton(DoofButton, UDim2.new(0.25, 0, 0, 50)) end)

ExecuteButton.MouseEnter:Connect(function() tweenButton(ExecuteButton, UDim2.new(0.27, 0, 0, 52)) end)
ExecuteButton.MouseLeave:Connect(function() tweenButton(ExecuteButton, UDim2.new(0.25, 0, 0, 50)) end)

ExecExecuteButton.MouseEnter:Connect(function() tweenButton(ExecExecuteButton, UDim2.new(0.27, 0, 0, 52)) end)
ExecExecuteButton.MouseLeave:Connect(function() tweenButton(ExecExecuteButton, UDim2.new(0.25, 0, 0, 50)) end)

FileButton.MouseEnter:Connect(function() tweenButton(FileButton, UDim2.new(0.27, 0, 0, 52)) end)
FileButton.MouseLeave:Connect(function() tweenButton(FileButton, UDim2.new(0.25, 0, 0, 50)) end)

MinimizeButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MinimizeIcon.Visible = true
end)

MinimizeIcon.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        MainFrame.Visible = true
        MinimizeIcon.Visible = false
    end
end)

-- Логика кнопок
NeutralButton.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    if char then
        char.HumanoidRootPart.CFrame = CFrame.new(87.5, 0.49, -5.99) -- Координаты с фото
        StatusCircle.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Зеленый (сработало)
        local team = game:GetService("Teams"):FindFirstChild("Neutral")
        if team then
            LocalPlayer.Team = team
        end
    else
        StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный (не сработало)
    end
end)

DoofButton.MouseButton1Click:Connect(function()
    for _, door in pairs(game.Workspace:GetDescendants()) do
        if door.Name == "Door" or door.Name == "Gate" then
            door:Destroy()
            StatusCircle.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Зеленый (сработало)
            return
        end
    end
    StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красный (не сработало)
end)

ExecuteButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ExecuteGui.Visible = true
end)

ExecExecuteButton.MouseButton1Click:Connect(function()
    if ExecInput.Text ~= "" then
        local success, result = pcall(function()
            loadstring(ExecInput.Text)()
        end)
        if success then
            StatusCircle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            Output.Text = "Script executed successfully!"
        else
            StatusCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            Output.Text = "Execution failed: " .. tostring(result)
        end
    end
end)

FileButton.MouseButton1Click:Connect(function()
    Output.Text = "File loading not implemented yet. Use loadstring manually."
end)
