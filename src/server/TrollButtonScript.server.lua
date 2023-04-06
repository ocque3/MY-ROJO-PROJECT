local Debris = game:GetService("Debris")
local TrollFolder = game.Workspace.TrollFolder
local trollButton = TrollFolder.Button 
local ballSpawns = TrollFolder.BallSpawners
local fireBall = game.ServerStorage:WaitForChild("FireBall")

local clickD = Instance.new("ClickDetector")
clickD.Parent = trollButton

local Range = Random.new()

local MAX_VELOCITY = 10

trollButton.ClickDetector.MouseClick:Connect(function()
    local newBall = fireBall:Clone()    
    newBall.Parent = game.Workspace
    for _, v in pairs(ballSpawns:GetChildren()) do
        v.CanCollide = false
        newBall.CFrame = v.CFrame + Vector3(0,0,3)
        newBall.Velocity = Vector3.new(
            Range:NextNumber(-MAX_VELOCITY, MAX_VELOCITY), 0, Range:NextNumber(-MAX_VELOCITY, MAX_VELOCITY)
        )
        
    end
    Debris:AddItem(newBall, 2)
    task.wait(0.2)
end)
