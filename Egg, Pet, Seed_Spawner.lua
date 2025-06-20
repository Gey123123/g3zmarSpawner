-- Final Visual-Only Custom Pet Spawner (Queen Bee, Raccoon, etc.)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui", gui)
ScreenGui.Name = "G3zVisualSpawnerUI"

-- Main Frame
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 400, 0, 320)
Frame.Position = UDim2.new(0.5, -200, 0.5, -160)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Frame.BorderSizePixel = 0

-- Title
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "g3zmar Visual Pet Spawner"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(90, 200, 255)

-- Input Fields
local function createInput(labelText, y)
    local label = Instance.new("TextLabel", Frame)
    label.Size = UDim2.new(0, 100, 0, 25)
    label.Position = UDim2.new(0, 20, 0, y)
    label.BackgroundTransparency = 1
    label.Text = labelText
    label.Font = Enum.Font.Gotham
    label.TextSize = 16
    label.TextColor3 = Color3.new(1, 1, 1)

    local box = Instance.new("TextBox", Frame)
    box.Name = labelText
    box.Size = UDim2.new(0, 240, 0, 25)
    box.Position = UDim2.new(0, 120, 0, y)
    box.Text = ""
    box.Font = Enum.Font.Gotham
    box.TextSize = 16
    box.TextColor3 = Color3.new(1, 1, 1)
    box.BackgroundColor3 = Color3.fromRGB(40, 40, 60)

    return box
end

local nameBox = createInput("Pet Name", 60)
local weightBox = createInput("Weight", 100)
local ageBox = createInput("Age", 140)

-- Dropdown for Pet Type
local dropdownLabel = Instance.new("TextLabel", Frame)
dropdownLabel.Position = UDim2.new(0, 20, 0, 180)
dropdownLabel.Size = UDim2.new(0, 100, 0, 25)
dropdownLabel.BackgroundTransparency = 1
dropdownLabel.Text = "Pet Type"
dropdownLabel.Font = Enum.Font.Gotham
dropdownLabel.TextSize = 16
dropdownLabel.TextColor3 = Color3.new(1, 1, 1)

local petDropdown = Instance.new("TextBox", Frame)
petDropdown.Position = UDim2.new(0, 120, 0, 180)
petDropdown.Size = UDim2.new(0, 240, 0, 25)
petDropdown.Text = "Queen Bee"
petDropdown.Font = Enum.Font.Gotham
petDropdown.TextSize = 16
petDropdown.TextColor3 = Color3.new(1, 1, 1)
petDropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 60)

-- Spawn Button
local spawnBtn = Instance.new("TextButton", Frame)
spawnBtn.Size = UDim2.new(0, 200, 0, 40)
spawnBtn.Position = UDim2.new(0.5, -100, 0, 240)
spawnBtn.Text = "Spawn"
spawnBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 150)
spawnBtn.TextColor3 = Color3.new(1, 1, 1)
spawnBtn.Font = Enum.Font.GothamBold
spawnBtn.TextSize = 20

-- Pet Visual Spawner
local function createPetModel(petType, displayName)
    local root = Instance.new("Model")
    root.Name = displayName

    local body = Instance.new("Part")
    body.Anchored = true
    body.CanCollide = false
    body.Size = Vector3.new(2, 2, 2)
    body.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 2, -4)
    body.Name = "Body"
    body.Parent = root

    local label = Instance.new("BillboardGui", body)
    label.Size = UDim2.new(0, 120, 0, 30)
    label.AlwaysOnTop = true
    local text = Instance.new("TextLabel", label)
    text.Size = UDim2.new(1, 0, 1, 0)
    text.Text = displayName
    text.TextScaled = true
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.new(1, 1, 1)

    if petType == "Queen Bee" then
        body.BrickColor = BrickColor.Yellow()
        local wing = Instance.new("Part", root)
        wing.Anchored = true
        wing.Size = Vector3.new(1, 0.2, 2)
        wing.Position = body.Position + Vector3.new(0, 0.5, 0)
        wing.Transparency = 0.4
        wing.BrickColor = BrickColor.White()
    elseif petType == "Raccoon" then
        body.BrickColor = BrickColor.Gray()
        local tail = Instance.new("Part", root)
        tail.Anchored = true
        tail.Size = Vector3.new(0.5, 0.5, 2)
        tail.Position = body.Position + Vector3.new(0, 0, -1.5)
        tail.BrickColor = BrickColor.Black()
    elseif petType == "Dragonfly" then
        body.Size = Vector3.new(1, 0.5, 1)
        body.BrickColor = BrickColor.Blue()
        local wing = Instance.new("Part", root)
        wing.Anchored = true
        wing.Size = Vector3.new(2, 0.1, 1)
        wing.Position = body.Position + Vector3.new(0, 0.3, 0)
        wing.BrickColor = BrickColor.White()
        wing.Transparency = 0.5
    elseif petType == "Disco Bee" then
        body.BrickColor = BrickColor.new("Bright yellow")
        body.Material = Enum.Material.Neon
    elseif petType == "Butterfly" then
        body.Size = Vector3.new(1, 0.4, 1)
        body.BrickColor = BrickColor.Red()
        local wings = Instance.new("Part", root)
        wings.Anchored = true
        wings.Size = Vector3.new(3, 0.2, 1)
        wings.Position = body.Position + Vector3.new(0, 0.2, 0)
        wings.BrickColor = BrickColor.Magenta()
        wings.Transparency = 0.3
    elseif petType == "Red Fox" then
        body.BrickColor = BrickColor.new("Bright orange")
        local tail = Instance.new("Part", root)
        tail.Anchored = true
        tail.Size = Vector3.new(0.5, 0.5, 2)
        tail.Position = body.Position + Vector3.new(0, 0, -1.5)
        tail.BrickColor = BrickColor.White()
    else
        body.BrickColor = BrickColor.Gray()
    end

    root.Parent = workspace
end

spawnBtn.MouseButton1Click:Connect(function()
    local name = nameBox.Text ~= "" and nameBox.Text or petDropdown.Text
    local petType = petDropdown.Text
    createPetModel(petType, name .. " | W: " .. weightBox.Text .. "kg | Age: " .. ageBox.Text)
end)

-- Close Button
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
