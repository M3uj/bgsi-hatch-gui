-- BGSI Hatch GUI (by ChatGPT)
-- Solo per scopo illustrativo ⚠️

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({Name = "🐾 BGSI | Hatch GUI", HidePremium = false, SaveConfig = true, ConfigFolder = "BGSI_Hatch_GUI"})

local Tab = Window:MakeTab({
	Name = "🐣 Uova",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local hatchSpeed = 1

Tab:AddToggle({
	Name = "✨ Auto Hatch",
	Default = false,
	Callback = function(v)
		getgenv().autoHatch = v
		while getgenv().autoHatch do
			game:GetService("ReplicatedStorage").Remotes.HatchEgg:FireServer("VoidEgg", 3) -- 3 = triple hatch
			wait(hatchSpeed)
		end
	end
})

Tab:AddSlider({
	Name = "⏱️ Hatch Speed (sec)",
	Min = 0.1,
	Max = 3,
	Default = 1,
	Color = Color3.fromRGB(255,125,0),
	Increment = 0.1,
	ValueName = "s",
	Callback = function(Value)
		hatchSpeed = Value
	end
})

Tab:AddButton({
	Name = "🔝 Equip Best Pet",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.EquipBest:FireServer()
	end    
})

Tab:AddButton({
	Name = "❌ Chiudi GUI",
	Callback = function()
        OrionLib:Destroy()
	end    
})

OrionLib:Init()
