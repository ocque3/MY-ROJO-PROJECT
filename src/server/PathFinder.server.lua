local SecondObsFolder = game.Workspace.SecondObstacle
local CorrectPathFolder  = SecondObsFolder.CorrectPath 

local function onTouched(part)
    part.BrickColor = BrickColor.Red()
    task.wait(3)
    part.BrickColor = BrickColor.new("Neon orange")
    
end

for _, part in pairs(CorrectPathFolder:GetChildren()) do
    part:SetAttribute("Stepped", false)
    part.Touched:Connect(function()
        if not part:GetAttribute("Stepped") then
            part:SetAttribute("Stepped", true)
            onTouched(part)
        end
        part:SetAttribute("Stepped", false)
    end)
  
end