local UI = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("UI")
local libraries = {}

local autofarmLibrary = Instance.new("ScrollingFrame")
autofarmLibrary.Name = "Autofarm"
autofarmLibrary.Size = UDim2.new(0, 200, 0, 100)
autofarmLibrary.Position = UDim2.new(0, 100, 0, 100)
autofarmLibrary.BackgroundColor3 = Color3.new(1, 1, 1)
autofarmLibrary.BorderSizePixel = 0
autofarmLibrary.Parent = UI

-- Buat library untuk auto-buy
local autobuyLibrary = Instance.new("ScrollingFrame")
autobuyLibrary.Name = "Autobuy"
autobuyLibrary.Size = UDim2.new(0, 200, 0, 100)
autobuyLibrary.Position = UDim2.new(0, 100, 0, 200)
autobuyLibrary.BackgroundColor3 = Color3.new(1, 1, 1)
autobuyLibrary.BorderSizePixel = 0
autobuyLibrary.Parent = UI

-- Buat library untuk auto-accept quest
local autoacceptLibrary = Instance.new("ScrollingFrame")
autoacceptLibrary.Name = "Autoaccept"
autoacceptLibrary.Size = UDim2.new(0, 200, 0, 100)
autoacceptLibrary.Position = UDim2.new(0, 100, 0, 300)
autoacceptLibrary.BackgroundColor3 = Color3.new(1, 1, 1)
autoacceptLibrary.BorderSizePixel = 0
autoacceptLibrary.Parent = UI

-- Tambahkan script ke library
local autofarmScript = Instance.new("LocalScript")
autofarmScript.Parent = autofarmLibrary
autofarmScript.Source = [[
    while true do
        -- script autofarm
    end
]]

local autobuyScript = Instance.new("LocalScript")
autobuyScript.Parent = autobuyLibrary
autobuyScript.Source = [[
    while true do
        -- script auto-buy
    end
]]

local autoacceptScript = Instance.new("LocalScript")
autoacceptScript.Parent = autoacceptLibrary
autoacceptScript.Source = [[
    while true do
        -- script auto-accept quest
    end
]]

-- Tambahkan ke libraries
table.insert(libraries, autofarmLibrary)
table.insert(libraries, autobuyLibrary)
table.insert(libraries, autoacceptLibrary)
