local ContentProvider = game:GetService("ContentProvider")
local killBrick = game.Workspace.Obstacle.KillBricks

local touched = false

for _, part in pairs(killBrick:GetChildren()) do
    part.touched:Connect(function(otherPart)
        local player = otherPart.Parent:FindFirstChildWhichIsA("Humanoid")
        if not touched and player then
            touched = false
            player.Health = 0
        end
        touched = false
    end)
end