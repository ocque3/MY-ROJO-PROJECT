local telePadFolder = game.Workspace.TelePadFolder
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local Touched = false

Players.PlayerAdded:Connect(function(player)
    for _, telePad in pairs(telePadFolder:GetChildren()) do
        telePad.Touched:Connect(function(hit)
            if not Touched then
                Touched = true

                if Players:GetPlayerFromCharacter(hit.Parent) then
                    player.Character.PrimaryPart.Position = Workspace.CheckPoints[player.leaderstats.Stage.Value].Position + Vector3.new(0,2,0)
                end
            end
            Touched = false
        end)
    end
end)