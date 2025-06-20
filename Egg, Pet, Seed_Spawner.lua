-- Grow a Garden Full Visual Spawner UI with All Pets, Seeds, Eggs
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

-- ✅ Visual Spawner Functions
local Spawner = {}

function Spawner.VisualPet(name)
    local model = Instance.new("Part")
    model.Size = Vector3.new(2.5, 2.5, 2.5)
    model.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 3, -4)
    model.Anchored = true
    model.Name = name
    model.BrickColor = BrickColor.new("Bright red")
    model.Shape = Enum.PartType.Block
    model.TopSurface = Enum.SurfaceType.Smooth
    model.BottomSurface = Enum.SurfaceType.Smooth
    model.Parent = workspace

    local tag = Instance.new("BillboardGui", model)
    tag.Size = UDim2.new(0, 100, 0, 30)
    tag.AlwaysOnTop = true
    local label = Instance.new("TextLabel", tag)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Text = name
    label.TextScaled = true
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 1, 1)
end

function Spawner.VisualEgg(name)
    local model = Instance.new("Part")
    model.Size = Vector3.new(2, 2, 2)
    model.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 3, -3)
    model.Anchored = true
    model.Name = name
    model.BrickColor = BrickColor.Yellow()
    model.Shape = Enum.PartType.Ball
    model.TopSurface = Enum.SurfaceType.Smooth
    model.BottomSurface = Enum.SurfaceType.Smooth
    model.Parent = workspace

    local tag = Instance.new("BillboardGui", model)
    tag.Size = UDim2.new(0, 100, 0, 30)
    tag.AlwaysOnTop = true
    local label = Instance.new("TextLabel", tag)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Text = name
    label.TextScaled = true
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 1, 1)
end

function Spawner.VisualSeed(name)
    local model = Instance.new("Part")
    model.Size = Vector3.new(1.5, 1.5, 1.5)
    model.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 3, -2)
    model.Anchored = true
    model.Name = name
    model.BrickColor = BrickColor.Green()
    model.Shape = Enum.PartType.Cylinder
    model.Orientation = Vector3.new(0, 0, 90)
    model.TopSurface = Enum.SurfaceType.Smooth
    model.BottomSurface = Enum.SurfaceType.Smooth
    model.Parent = workspace

    local tag = Instance.new("BillboardGui", model)
    tag.Size = UDim2.new(0, 100, 0, 30)
    tag.AlwaysOnTop = true
    local label = Instance.new("TextLabel", tag)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Text = name
    label.TextScaled = true
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 1, 1)
end

-- ✅ Lists
local pets = { "Fox", "Raccoon", "Deer", "Bunny", "Black Bunny", "Golden Lab", "Dog", "Cat", "Chicken", "Spotted Deer", "Monkey", "Pig", "Rooster", "Cow", "Polar Bear", "Sea Otter", "Silver Monkey", "Turtle", "Brown Mouse", "Grey Mouse", "Caterpillar", "Giant Ant", "Snail", "Praying Mantis", "Dragonfly", "Blood Hedgehog", "Blood Kiwi", "Blood Owl", "Bee", "Honey Bee", "Bear Bee", "Petal Bee", "Queen Bee", "Disco Bee", "Butterfly", "Moth", "Tarantula Hawk", "Echo Frog", "Frog", "Night Owl", "Hedgehog", "Cooked Owl", "Red Fox", "Orange Tabby", "Squirrel", "Wasp", "Pack Bee", "Mole", "Night Owl" }

local seeds = { "Carrot", "Strawberry", "Blueberry", "Orange Tulip", "Tomato", "Daffodil", "Corn", "Watermelon", "Pumpkin", "Apple", "Bamboo", "Coconut", "Cactus", "Dragon Fruit", "Mango", "Grape", "Mushroom", "Pepper", "Cacao", "Beanstalk", "Ember Lily", "Sugar Apple", "Pear", "Peach", "Raspberry", "Pineapple", "Dragon Pepper", "Cocovine", "Bendboo", "Suncoil", "Violet Corn", "Bee Balm", "Succulent", "Crocus", "Lavender", "Moon Blossom", "Mint", "Moonflower", "Nightshade", "Glowshroom", "Moonglow", "Starfruit" }

local eggs = { "Common Egg", "Uncommon Egg", "Rare Egg", "Legendary Egg", "Mythical Egg", "Bug Egg", "Anti Bee Egg", "Night Egg", "Bee Egg", "Blood Egg" }

-- ✅ UI Setup
local ScreenGui = Instance.new("ScreenGui", gui)
ScreenGui.Name = "G3zSpawnerUI"

local function makeButton(text, posY, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 300, 0, 30)
    btn.Position = UDim2.new(0.5, -150, 0, posY)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(52, 152, 219)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.Parent = ScreenGui
    btn.MouseButton1Click:Connect(callback)
end

-- ✅ Add Buttons for Visual Spawning
local spacing = 0.035
local y = 0.05
for _, name in ipairs(pets) do
    makeButton("Spawn Pet: " .. name, y, function()
        Spawner.VisualPet(name)
    end)
    y = y + spacing
end
for _, name in ipairs(seeds) do
    makeButton("Spawn Seed: " .. name, y, function()
        Spawner.VisualSeed(name)
    end)
    y = y + spacing
end
for _, name in ipairs(eggs) do
    makeButton("Spawn Egg: " .. name, y, function()
        Spawner.VisualEgg(name)
    end)
    y = y + spacing
end
