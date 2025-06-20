-- Grow a Garden Full Spawner UI with All Pets, Seeds, Eggs
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")
local Remote = ReplicatedStorage:FindFirstChild("RemoteEvent") or ReplicatedStorage:FindFirstChild("Remotes")

-- ✅ Spawner Functions
local Spawner = {}
function Spawner.SpawnPet(name)
    Remote:FireServer("SpawnPet", {PetName = name, KG = 1, Age = 1})
end
function Spawner.SpawnSeed(name)
    Remote:FireServer("SpawnSeed", name)
end
function Spawner.SpawnEgg(name)
    Remote:FireServer("SpawnEgg", name)
end

-- ✅ Lists
local pets = {
    "Fox", "Raccoon", "Deer", "Bunny", "Black Bunny", "Golden Lab", "Dog", "Cat",
    "Chicken", "Spotted Deer", "Monkey", "Pig", "Rooster", "Cow", "Polar Bear",
    "Sea Otter", "Silver Monkey", "Turtle", "Brown Mouse", "Grey Mouse",
    "Caterpillar", "Giant Ant", "Snail", "Praying Mantis", "Dragonfly",
    "Blood Hedgehog", "Blood Kiwi", "Blood Owl", "Bee", "Honey Bee", "Bear Bee",
    "Petal Bee", "Queen Bee", "Disco Bee", "Butterfly", "Moth", "Tarantula Hawk",
    "Echo Frog", "Frog", "Night Owl", "Hedgehog", "Cooked Owl", "Red Fox",
    "Orange Tabby", "Squirrel", "Wasp", "Pack Bee", "Mole", "Night Owl"
}

local seeds = {
    "Carrot", "Strawberry", "Blueberry", "Orange Tulip", "Tomato", "Daffodil",
    "Corn", "Watermelon", "Pumpkin", "Apple", "Bamboo", "Coconut", "Cactus",
    "Dragon Fruit", "Mango", "Grape", "Mushroom", "Pepper", "Cacao",
    "Beanstalk", "Ember Lily", "Sugar Apple", "Pear", "Peach", "Raspberry",
    "Pineapple", "Dragon Pepper", "Cocovine", "Bendboo", "Suncoil", "Violet Corn",
    "Bee Balm", "Succulent", "Crocus", "Lavender", "Moon Blossom", "Mint",
    "Moonflower", "Nightshade", "Glowshroom", "Moonglow", "Starfruit"
}

local eggs = {
    "Common Egg", "Uncommon Egg", "Rare Egg", "Legendary Egg",
    "Mythical Egg", "Bug Egg", "Anti Bee Egg", "Night Egg", "Bee Egg", "Blood Egg"
}

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

-- ✅ Add Buttons
local spacing = 0.035
local y = 0.05
for _, data in ipairs({
    {pets, Spawner.SpawnPet},
    {seeds, Spawner.SpawnSeed},
    {eggs, Spawner.SpawnEgg}
}) do
    for _, name in ipairs(data[1]) do
        makeButton("Spawn " .. name, y, function()
            data[2](name)
        end)
        y = y + spacing
        if y > 0.95 then break end
    end
end
