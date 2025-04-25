-- BGSI Supreme Hatch - A GUI for Enhanced Egg Hatching
-- Script illustrativo per scopi educativi

-- Load UI Library (simple & clean)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/UI-Library/main/Lib.lua"))()
local Window = Library:CreateWindow("BGSI Supreme Hatch")

-- Tabs
local MainTab = Window:CreateTab("Main")
local EggsTab = Window:CreateTab("Egg Settings")
local MiscTab = Window:CreateTab("Misc")

-- Variables
local autoHatch = false
local hatchSpeed = 0.05
local selectedEgg = "Void Egg"
local autoSell = false
local autoMerge = false

-- Egg list
local eggs = {
    "Void Egg",
    "Mythic Egg",
    "Galaxy Egg",
    "Demonic Egg",
    "Heaven Egg"
}

-- Functions
function HatchEgg()
    while autoHatch do
        local args = {
            [1] = selectedEgg,
            [2] = "TripleEgg"
        }
        game:GetService("ReplicatedStorage").RemoteFunctions.HatchEgg:InvokeServer(unpack(args))
        wait(hatchSpeed)
    end
end

function SellAll()
    while autoSell do
        game:GetService("ReplicatedStorage").RemoteFunctions.SellAll:FireServer()
        wait(10)
    end
end

function MergeAll()
    while autoMerge do
        game:GetService("ReplicatedStorage").RemoteFunctions.MergePets:FireServer()
        wait(15)
    end
end

-- GUI Elements
MainTab:CreateToggle("Auto Hatch", function(val)
    autoHatch = val
    if val then
        spawn(HatchEgg)
    end
end)

MainTab:CreateSlider("Hatch Speed (lower = faster)", 0.01, 1, function(val)
    hatchSpeed = val
end)

EggsTab:CreateDropdown("Select Egg", eggs, function(val)
    selectedEgg = val
end)

MiscTab:CreateToggle("Auto Sell Pets", function(val)
    autoSell = val
    if val then
        spawn(SellAll)
    end
end)

MiscTab:CreateToggle("Auto Merge Pets", function(val)
    autoMerge = val
    if val then
        spawn(MergeAll)
    end
end)

-- Notification
Library:Notification("Loaded", "BGSI Supreme Hatch Loaded! Enjoy cracking eggs bro 🥚🔥")
