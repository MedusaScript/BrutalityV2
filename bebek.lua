local autogumb = false
local autogumc = false

if game:GetService("CoreGui"):FindFirstChild("KAIOD") then
    game:GetService("CoreGui"):FindFirstChild("KAIOD"):Destroy()
	_G.loopkill = true
end
local KAIOD = Instance.new("ScreenGui")
local Frame = Instance.new("ImageLabel")
local UIGradient = Instance.new("UIGradient")
local Kill = Instance.new("TextButton")
local Target = Instance.new("TextBox")
local Loop = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local plr = game:GetService("Players").LocalPlayer
KAIOD.Name = "KAIOD"
KAIOD.Parent = game:GetService("CoreGui")
Frame.Name = "Frame"
Frame.Parent = KAIOD
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Position = UDim2.new(0.0630208328, 0, 0.196662694, 0)
Frame.Size = UDim2.new(0, 237, 0, 352)
Frame.Image = "rbxassetid://3570695787"
Frame.ScaleType = Enum.ScaleType.Slice
Frame.SliceCenter = Rect.new(100, 100, 100, 100)
Frame.SliceScale = 0.120
Frame.Active = true
Frame.Draggable = true
UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.51, Color3.fromRGB(20, 20, 20)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(25, 25, 25))}
UIGradient.Parent = Frame
Kill.Name = "Kill"
Kill.Parent = Frame
Kill.BackgroundColor3 = Color3.fromRGB(152, 0, 2)
Kill.Position = UDim2.new(0.278481007, 0, 0.529105186, 0)
Kill.Size = UDim2.new(0, 104, 0, 27)
Kill.Text = "auto bounty"
Kill.TextColor3 = Color3.fromRGB(161, 161, 161)
Kill.TextScaled = true
Kill.TextSize = 14.000
Kill.TextWrapped = true
Target.Name = "Target"
Target.Parent = Frame
Target.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
Target.Position = UDim2.new(0.0759493634, 0, 0.355113626, 0)
Target.Size = UDim2.new(0, 200, 0, 45)
Target.Font = Enum.Font.SourceSans
Target.PlaceholderColor3 = Color3.fromRGB(218, 218, 218)
Target.PlaceholderText = "Target Name|DisplayName"
Target.Text = ""
Target.TextColor3 = Color3.fromRGB(218, 218, 218)
Target.TextSize = 19.000
Loop.Name = "Loop"
Loop.Parent = Frame
Loop.BackgroundColor3 = Color3.fromRGB(152, 0, 2)
Loop.Position = UDim2.new(0.278481007, 0, 0.662157595, 0)
Loop.Size = UDim2.new(0, 104, 0, 27)
Loop.Text = "Loop"
Loop.TextColor3 = Color3.fromRGB(161, 161, 161)
Loop.TextScaled = true
Loop.TextSize = 14.000
Loop.TextWrapped = true
TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.0759493634, 0, 0.838068187, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Kill Player Script"
TextLabel.TextColor3 = Color3.fromRGB(121, 121, 121)
TextLabel.TextSize = 21.000
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.TextYAlignment = Enum.TextYAlignment.Top
ImageLabel.Parent = Frame
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 0.800
ImageLabel.Position = UDim2.new(0.295358658, 0, 0.0454545468, 0)
ImageLabel.Size = UDim2.new(0, 96, 0, 96)
ImageLabel.Image = ""

local function GetPlayer(name)
    if name == "" then
        return nil
    elseif name == "random" then
        local players = game:GetService("Players"):GetPlayers()
        return players[math.random(1, #players)]
    else
        for _, player in pairs(game:GetService("Players"):GetPlayers()) do
            if player.Name:lower():sub(1, #name) == name:lower() or player.DisplayName:lower():sub(1, #name) == name then
                return player
            end
        end
    end
end

Target.Focused:Connect(function()
    while Target:IsFocused() and wait() do
        local user = GetPlayer(Target.Text)
        if user then
            ImageLabel.Image = game:GetService("Players"):GetUserThumbnailAsync(user.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
        end
    end
end)

Target.FocusLost:Connect(function()
    while wait() do
        if Target:IsFocused() then
            break
        end
        if Target.Text ~= "random" then
            break
        end
        ImageLabel.Image = game:GetService("Players"):GetUserThumbnailAsync(GetPlayer(Target.Text).UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end
end)

Kill.MouseButton1Click:Connect(function(valuedata)
    autobounty = valuedata
end)

spawn(function()
    while wait() do
        pcall(function()
            if autobounty then
                print("Auto Bounty True")
                autogumb = true
                autogumc = true
            else
                print("Auto Bounty False")
                autogumb = false
                autogumc = false
            end
        end)
    end
end)

function RemoteAutogumB()
    AutoRemoteB()
    print("Gum B")
end

function RemoteAutogumC()
    AutoRemoteC()
    print("Gum C")
    remoteistrueC = true
end

spawn(function()
    while wait() do
        pcall(function()
            if autogumb then
                RemoteAutogumB()
                print("AutogumB is true")
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if autogumc then
                RemoteAutogumC()
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if remoteistrueC then
                local Players = game:GetService("Players")
                local lp = Players.LocalPlayer
                local toolName = getgenv().AutoBountyConfig["Tool Name"]
                for _, player in pairs(Players:GetPlayers()) do
                    wait()
                    for _, tool in pairs(player.Backpack:GetChildren()) do
                        if tool.Name == toolName then
                            tool.Parent = lp.Backpack
                        end
                    end
                end
                wait(1)
                lp.Character:WaitForChild("Humanoid").Humanoid:UnequipTools()
                local humanoidClone = lp.Character.Humanoid:Clone()
                local target = GetPlayer(Target.Text)
                
                if target then
                    local tool = lp.Backpack:FindFirstChild(toolName)
                    
                    if tool then
                        lp.Character.Animate.Disabled = true
                        lp.Character.Humanoid:Destroy()
                        humanoidClone.Parent = lp.Character
                        tool.Parent = lp.Character
                        wait(0.25)
                        game:GetService("Workspace").TouchInterestChanged:Fire(target.Character.HumanoidRootPart, tool.Handle)
                        local thrust = Instance.new('BodyThrust', lp.Character.HumanoidRootPart)
                        thrust.Force = Vector3.new(9999, 9999, 9999)
                        thrust.Name = "FlingForce"
                    else
                        warn("No " .. tostring(toolName) .. " in backpack!")
                    end
                end
            end
        end)
    end
end)
