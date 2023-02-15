local lasersfolder = game.Workspace.Lasers 

for _,laser in pairs(lasersfolder:GetChildren()) do
    local touched = false
    laser.DmgPart.KillPart.Touched:Connect(function(otherPart)
        local humanoid = otherPart.Parent:FindFirstChildWhichIsA("Humanoid")
        if not touched  and humanoid then
            humanoid.Health = 0
        end
        touched = false
    end)
end