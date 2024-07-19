getgenv().hit_sound_Enabled = true
getgenv().hit_effect_Enabled = true
getgenv().self_effect_Enabled = true
getgenv().kill_effect_Enabled = true

function initializate(dataFolder_name: string)
	local nurysium_Data = Instance.new('Folder', game:GetService('CoreGui'))
	nurysium_Data.Name = dataFolder_name

	hit_Sound = Instance.new('Sound', nurysium_Data)
	hit_Sound.SoundId = 'rbxassetid://6607204501'
	hit_Sound.Volume = 10
end
