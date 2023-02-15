local TweenService = game:GetService("TweenService")
local spikesFolder = game.Workspace.SpikesFolder

for _,spike in pairs(spikesFolder:GetChildren()) do
    local spikePosition = spike.spikePart.Position 
    local spikeSize = spike.spikePart.Size 


    local goal = {}
    goal.Position = spikePosition - Vector3.new(0,2.05,0)
    goal.Size = spikeSize - Vector3.new(0,4.1,0)

    local tweenInfo = TweenInfo.new(2,Enum.EasingStyle.Cubic,Enum.EasingDirection.In, -2, true,3)
    local Tween = TweenService:Create(spike.spikePart,tweenInfo,goal)
    Tween:Play(0.5)

    spike.spikePart:SetAttribute("touched", false)
    spike.spikePart.Touched:Connect(function(otherPart)
        local humanoid = otherPart.Parent:FindFirstChildWhichIsA("Humanoid")
        if not spike.spikePart:GetAttribute("touched") and humanoid then
            spike.spikePart:SetAttribute("touched", true)
            humanoid.Health = 0
        end
        spike.spikePart:SetAttribute("touched", false)
    end)
end