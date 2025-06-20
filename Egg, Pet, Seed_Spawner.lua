-- Grow a Garden: Custom Visual Spawner UI (Pet / Seed / Egg)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui", gui)
ScreenGui.Name = "G3zmarVisualSpawner"

-- Frame
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.Position = UDim2.new(0.5, -200, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Frame.BorderSizePixel = 0
Frame.Name = "MainFrame"

-- Title
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "g3zmar OP Script Spawner"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(90, 200, 255)

-- Tab Buttons
local currentTab = "Pet"
local function createTab(text, pos, parent)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0, 120, 0, 30)
    btn.Position = UDim2.new(0, pos, 0, 50)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.MouseButton1Click:Connect(function()
        currentTab = text
    end)
end

createTab("Pet", 20, Frame)
createTab("Seed", 150, Frame)
createTab("Egg", 280, Frame)

-- Input Fields
local function createInput(name, y)
    local label = Instance.new("TextLabel", Frame)
    label.Size = UDim2.new(0, 100, 0, 25)
    label.Position = UDim2.new(0, 20, 0, y)
    label.BackgroundTransparency = 1
    label.Text = name
    label.Font = Enum.Font.Gotham
    label.TextSize = 16
    label.TextColor3 = Color3.new(1, 1, 1)

    local box = Instance.new("TextBox", Frame)
    box.Name = name
    box.Size = UDim2.new(0, 240, 0, 25)
    box.Position = UDim2.new(0, 120, 0, y)
    box.Text = ""
    box.Font = Enum.Font.Gotham
    box.TextSize = 16
    box.TextColor3 = Color3.new(1, 1, 1)
    box.BackgroundColor3 = Color3.fromRGB(40, 40, 60)

    return box
end

local nameBox = createInput("Pet Name", 100)
local weightBox = createInput("Weight", 140)
local ageBox = createInput("Age", 180)

-- Visual Spawn Functions
local function spawnVisual(name, kind)
    local part = Instance.new("Part")
    part.Anchored = true
    part.CanCollide = false
    part.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 2, -4)
    part.Size = Vector3.new(2, 2, 2)
    part.Shape = kind == "Egg" and Enum.PartType.Ball or Enum.PartType.Block
    part.BrickColor = kind == "Seed" and BrickColor.Green() or kind == "Egg" and BrickColor.Yellow() or BrickColor.Red()
    part.Parent = workspace

    local label = Instance.new("BillboardGui", part)
    label.Size = UDim2.new(0, 100, 0, 30)
    label.AlwaysOnTop = true
    local text = Instance.new("TextLabel", label)
    text.Size = UDim2.new(1, 0, 1, 0)
    text.Text = name
    text.TextScaled = true
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.new(1, 1, 1)
end

-- Spawn Button
local spawnBtn = Instance.new("TextButton", Frame)
spawnBtn.Size = UDim2.new(0, 200, 0, 40)
spawnBtn.Position = UDim2.new(0.5, -100, 0, 240)
spawnBtn.Text = "Spawn"
spawnBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 150)
spawnBtn.TextColor3 = Color3.new(1, 1, 1)
spawnBtn.Font = Enum.Font.GothamBold
spawnBtn.TextSize = 20

spawnBtn.MouseButton1Click:Connect(function()
    local name = nameBox.Text ~= "" and nameBox.Text or "Unknown"
    spawnVisual(name, currentTab)
end)

-- X Button
local closeBtn = Instance.new("TextButton", Frame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
