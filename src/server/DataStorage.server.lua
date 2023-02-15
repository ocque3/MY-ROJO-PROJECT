local Players = game:GetService("Players")
local DataStorage = game:GetService("DataStoreService")
local LastSavedData = DataStorage:GetDataStore("LastSaved")
local checkPoints = game.Workspace.CheckPoints

local function savedCPandPts(player)
    local saveData = {
        player.leaderstats.Stages.Value,
        player.leaderstats.Points.Value
    } 

    local success, err = pcall(function()
        if player.UserId == 14804019 and saveData[1] > 0 then
            LastSavedData:UpdateAsync(14804019, 0)
        else
            LastSavedData:SetAsync(player.UserId, saveData)
        end
    end)

    if success then
        print("Player stage and points is saved!")
    else
        print("Player stage and points was not saved!")
        warn(err)
    end
end



game.Players.PlayerRemoving:Connect(function(player)
    savedCPandPts(player)
end)

game:BindToClose(function()
    for _, player in pairs(game.Players:GetPlayers()) do
        savedCPandPts(player)
    end
end)

Players.PlayerAdded:Connect(function(player)
    local data 
    local success, err = pcall(function()
        data = LastSavedData:GetAsync(player.UserId)
    end)

    if success and data then
        player.leaderstats.Stages.Value = data[1]
        player.leaderstats.Points.Value = data[2]
    else
        print("Player has no data!")
        warn(err)
    end

    player.CharacterAdded:Connect(function(character)
        local character = player.Character or player:WaitForChild("Character")
    
        character:MoveTo(checkPoints[player.leaderstats.Stages.Value].Position)
        
        for _, v in pairs(checkPoints:GetChildren()) do
            if v:FindFirstAncestorWhichIsA("BasePart") then
                v.Touched:Connect(function(hit)
                    if hit.Parent == checkPoints then
                        if tonumber(hit.Name) == player.leaderstats.Stages.Value + 1 then
                            player.leaderstats.Stages.Value += 1
                        end
                    end
                end)
            end
        end
    end)
end)