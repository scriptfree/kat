-- Load OrionLib (make sure this is loaded first)
local OrionLib = loadstring(game:HttpGet(('https://pastebin.com/raw/vaRMeAp8')))()
local Window = OrionLib:MakeWindow({Name = "The Battle Bricks", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest"})

-- Show initial notification
OrionLib:MakeNotification({
    Name = "Welcome!",
    Content = "Script loaded successfully! Thank you for using my script.",
    Image = "rbxassetid://17829956110",
    Time = 5
})

-- Create the 'Main' tab
local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4034483344",
    PremiumOnly = false
})

-- Add a section under the 'Main' tab
local Section = Tab:AddSection({
    Name = "Main"
})

Tab:AddButton({
    Name = "Remove Tools",
    Callback = function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Success!",
            Text = "Tools Removed",
            Duration = 3
        })

        while true do
            wait(0.01)
            pcall(function()
                for _, player in pairs(game.Players:GetPlayers()) do
                    if player.Name ~= game.Players.LocalPlayer.Name then
                        for _, tool in pairs(player.Character:GetChildren()) do
                            if tool:IsA("Tool") and (tool.Name == "Knife" or tool.Name == "Revolver") then
                                tool.ClientEvent:FireServer("ConfirmDestruction", {})
                            end
                        end
                        for _, tool in pairs(player.Backpack:GetChildren()) do
                            if tool:IsA("Tool") and (tool.Name == "Knife" or tool.Name == "Revolver") then
                                tool.ClientEvent:FireServer("ConfirmDestruction", {})
                            end
                        end
                    end
                end
            end)
        end
    end    
})

local bringAllEnabled = false

Tab:AddToggle({
    Name = "Bring All",
    Default = false,
    Callback = function(Value)
        bringAllEnabled = Value
        if bringAllEnabled then
            while bringAllEnabled do
                pcall(function()
                    for _, player in pairs(game.Players:GetPlayers()) do
                        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            player.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                end)
                wait(0.1)
            end
        end
    end
})



-- Credits Tab
local Tab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://18719810809",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Developer"
})

Tab:AddLabel("Made by : nnty.")

Tab:AddButton({
    Name = "Close UI",
    Callback = function()
            OrionLib:Destroy()
    end    
})

OrionLib:Init()
