local Players = game:GetService("Players")
local DataStorage = game:GetService("DataStoreService")
local checkPointSystem = DataStorage:GetDataStore("LastCheckPoint")
local checkPoints = game.Workspace.CheckPoints
local RunService = game:GetService("RunService")

local function onCharacterAdded(character, player, stages)
    player:SetAttribute("IsAlive", true)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Died:Connect(function()
        local points = player.leaderstats.Points
        points.Value = 0
        player:SetAttribute("IsAlive", false)
    end)
   
end

local function savedCheckPoint(player)
    
    local saveData = {
        player.leaderstats.Stage.Value
    }

    local success, err = pcall(function()
        if player.UserId == 14804019 and saveData[1] > 0 then
            checkPointSystem:UpdateAsync(14804019, 0)
        else
            checkPointSystem:SetAsync(player.UserId, saveData)
        end
    end)

    if success then
        print("Player stage is saved!")
    else
        print("Player stage was not saved!")
    end
end
-- If Player left the game --

Players.PlayerRemoving:Connect(function(player)
    savedCheckPoint(player)
end)

-- If Player game Crashed --

game:BindToClose(function()
    if RunService:IsStudio() then return end

    for _, player in pairs(game.Players:GetPlayers()) do
        savedCheckPoint(player)
    end
end)

--  Player Added leaderstats + Loaded Data

Players.PlayerAdded:Connect(function(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Parent = player
    leaderstats.Name = "leaderstats"

    local stage = Instance.new("IntValue")
    stage.Parent = leaderstats
    stage.Name = "Stage"
    stage.Value = 0


    local Points = Instance.new("IntValue")
    Points.Parent = leaderstats
    Points.Name = "Points"
    Points.Value = 0

    -- Retrieve Player Data

    local data 
    local success, err = pcall(function()
        data = checkPointSystem:GetAsync(player.UserId)
    end)

    if success and data then
        stage.Value = data[1]
    else
        print("Player has no data!")
        warn(err)
    end

    player:SetAttribute("IsAlive", false)

    player.CharacterAdded:Connect(function(character)
        character = player.Character
        repeat task.wait() until character ~= nil 

        local checkPoint = checkPoints:FindFirstChild(stage.Value)
        character:MoveTo(checkPoint.Position + Vector3.new(0,2,0))

        onCharacterAdded(character,player, stage)
    end)
    
    for _, v in pairs(checkPoints:GetChildren()) do
        v.Touched:Connect(function(otherpart)
            player = Players:GetPlayerFromCharacter(otherpart.Parent)
            local stageValue = player.leaderstats:WaitForChild("Stage")

            if player and stageValue.Value < v.Name then
                stageValue.Value = v.Name
            else
                return
            end
        end)
    end

end)


while true do
    task.wait(1)
    local playerList = Players:GetPlayers()
    for currentPlayer = 1, #playerList do
        local player = playerList[currentPlayer]
        if player:GetAttribute("IsAlive") then
            local points = player.leaderstats.Points
            points.Value = points.Value + 1
            task.wait(1)
        end
        
    end
end


