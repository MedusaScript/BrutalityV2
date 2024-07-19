function initializate(dataFolder_name: string)
	local nurysium_Data = Instance.new('Folder', game:GetService('CoreGui'))
	nurysium_Data.Name = dataFolder_name

	hit_Sound = Instance.new('Sound', nurysium_Data)
	hit_Sound.SoundId = 'rbxassetid://6607204501'
	hit_Sound.Volume = 10
end

getgenv().aura_Enabled = false
getgenv().hit_sound_Enabled = false
getgenv().hit_effect_Enabled = false
getgenv().night_mode_Enabled = false
getgenv().trail_Enabled = false
getgenv().self_effect_Enabled = false
getgenv().kill_effect_Enabled = false
getgenv().shaders_effect_Enabled = false
getgenv().ai_Enabled = false
getgenv().spectate_Enabled = false

task.defer(function()
	game:GetService("RunService").Heartbeat:Connect(function()

		if not local_player.Character then
			return
		end

		if getgenv().self_effect_Enabled then
			local effect = game:GetObjects("rbxassetid://17519530107")[1]

			effect.Name = 'nurysium_efx'

			if local_player.Character.PrimaryPart:FindFirstChild('nurysium_efx') then
				return
			end

			effect.Parent = local_player.Character.PrimaryPart
		else

			if local_player.Character.PrimaryPart:FindFirstChild('nurysium_efx') then
				local_player.Character.PrimaryPart['nurysium_efx']:Destroy()
			end
		end

	end)
end)

local Services = {
	game:GetService('AdService'),
	game:GetService('SocialService')
}

function initializate(dataFolder_name: string)
    local nurysium_Data = Instance.new('Folder', game:GetService('CoreGui'))
    nurysium_Data.Name = dataFolder_name

    hit_Sound = Instance.new('Sound', nurysium_Data)
    hit_Sound.SoundId = 'rbxassetid://8632670510'
    hit_Sound.Volume = 5
end

function resolve_parry_Remote()
    for _, value in Services do
        local temp_remote = value:FindFirstChildOfClass('RemoteEvent')

        if not temp_remote then
            continue
        end

        if not temp_remote.Name:find('\n') then
            continue
        end

        parry_remote = temp_remote
    end
end
