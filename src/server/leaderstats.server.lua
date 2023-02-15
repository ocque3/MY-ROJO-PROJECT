local Players = game:GetService("Players")
local checkPoints = workspace:WaitForChild("CheckPoints")

local function onCharacterAdded(character, player, stages)
    player:SetAttribute("IsAlive", true)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Died:Connect(function()
        local points = player.leaderstats.Points
        points.Value -= 10
        if points.Value > 10 then
            points.Value -= 10
        else
            points.Value -= 1
        end
        player:SetAttribute("IsAlive", false)
    end)
   
end


Players.PlayerAdded:Connect(function(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Parent = player
    leaderstats.Name = "leaderstats"

    local stages = Instance.new("IntValue")
    stages.Parent = leaderstats
    stages.Name = "Stages"
    stages.Value = 0


    local Points = Instance.new("IntValue")
    Points.Parent = leaderstats
    Points.Name = "Points"
    Points.Value = 0

    player:SetAttribute("IsAlive", false)

    player.CharacterAdded:Connect(function(character)
        onCharacterAdded(character,player, stages)
        
    end)
end)


while true do
    task.wait(1)
    local playerList = Players:GetPlayers()
    for currentPlayer = 1, #playerList do
        local player = playerList[currentPlayer]
        if player:GetAttribute("IsAlive") then
            local points = player.leaderstats.Points
            points.Value = points.Value + 1
        end
        
    end
end