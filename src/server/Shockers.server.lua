local checkerShockerFolder = game.Workspace.CheckersObstacle
local Touched = false

local EMIT_AMOUNT = 50

local function killPlayer(otherPart)
    local character = otherPart.Parent
    local humanoid = character:FindFirstChildWhichIsA("Humanoid")

    if not Touched and humanoid then
        Touched = true
        humanoid.Health = 0
    end
    task.wait(2)
    Touched = false
end


for _, shockPart in pairs(checkerShockerFolder:GetChildren()) do
    shockPart.Touched:Connect(function(otherPart)
        local character = otherPart.Parent
        local humanoid = character:FindFirstChildWhichIsA("Humanoid")

        if not Touched and humanoid then
            Touched = true
            humanoid.Health = 0
            shockPart.Explosion:Emit(EMIT_AMOUNT)
        end
        task.wait(2)
        Touched = false
    end)
    
end