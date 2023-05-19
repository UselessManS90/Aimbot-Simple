--Simple Aimbot by DiemzMasters and AlohaGryphin

local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

local aimPart = "Head"

local function getClosestEnemy()
  local enemies = game.Players:GetPlayers()
  local closestEnemy = nil
  local closestDistance = math.huge

  for _, enemy in ipairs(enemies) do
    if enemy ~= player then
      local distance = (enemy.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
      if distance < closestDistance then
        closestEnemy = enemy
        closestDistance = distance
      end
    end
  end

  return closestEnemy
end

local function aimAtEnemy()
  local enemy = getClosestEnemy()
  if enemy then
    local enemyHead = enemy.Character[aimPart]
    local cameraCFrame = camera.CFrame
    local targetCFrame = enemyHead.CFrame
    cameraCFrame = cameraCFrame.LookAt(targetCFrame.Position)
    camera.CFrame = cameraCFrame
  end
end

game.RunService.RenderStepped:Connect(aimAtEnemy)
