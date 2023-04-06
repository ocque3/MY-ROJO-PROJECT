-- local Players = game:GetService("Players")
-- local RepStorage = game:GetService("ReplicatedStorage")
-- local screenPrompt = RepStorage.ScreenPrompt
-- local Triggers = game.Workspace.Doors.Triggers


-- local Touched = false
-- local CoolDown = 5

-- Players.PlayerAdded:Connect(function(player)
--     player.CharacterAdded:Connect(function(char)
--         local humanoid = char:FindFirstAncestorWhichIsA("Humanoid")
--         for _, v in pairs(Triggers:GetChildren()) do
--             v.Touched:Connect(function(otherPart)
--                 if v.Name == "trigger1" then
--                     if not Touched and humanoid then
--                         Touched = true
--                         screenPrompt:FireClient(player, "What is 2 + 2?")
--                     end
--                     task.wait(CoolDown)
--                     Touched = false
--                 elseif v.Name == "trigger2" then
--                     if not Touched and humanoid then
--                         Touched = true
--                         screenPrompt:FireClient(player, "What is 3 + 4?")
--                     end
--                     task.wait(CoolDown)
--                     Touched = false
--                 end
--             end)
--         end
--     end)
-- end)

-- -- local function onTouched(otherPart, player)
-- --     local character = otherPart.Parent
-- --     local humanoid  = character:FindFirstChildWhichIsA("Humanoid")

-- --     if not Touched and humanoid then
-- --         Touched = true
       
-- --     end
-- --     task.wait(CoolDown)
-- -- end

