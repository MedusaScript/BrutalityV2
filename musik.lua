game:GetService("StarterGui")
function play_kill_effect(value)
    task.defer(function()
        local bell = game:GetObjects("rbxassetid://17519762269")[1]

        bell.Name = 'Yeat_BELL'
        bell.Parent = workspace

        bell.Position = Part.Position - Vector3.new(0, 20, 0)
        bell:WaitForChild('Sound'):Play()

        game:GetService("TweenService"):Create(bell, TweenInfo.new(0.85, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
            Position = Part.Position + Vector3.new(0, 10, 0)
        }):Play()

        task.delay(5, function()
            game:GetService("TweenService"):Create(bell, TweenInfo.new(1.45, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
                Position = Part.Position + Vector3.new(0, 100, 0)
            }):Play()
        end)

        task.delay(6, function()
            bell:Destroy()
        end)
    end)
end

task.defer(function()
    workspace.Alive.ChildRemoved:Connect(function(child)
        if not workspace.Dead:FindFirstChild(child.Name) then
            return
        end

        if getgenv().kill_effect_Enabled then
            play_kill_effect(child.HumanoidRootPart)
        end
    end)
end)
