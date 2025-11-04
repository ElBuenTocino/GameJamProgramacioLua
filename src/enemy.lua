Actor = Actor or require "lib/actor"
Vector = Vector or require "lib/vector"
Player = Player or require "src/player"
local Enemy = Actor:extend()
local p = nil
function Enemy:new()
  Enemy.super.new(self, "src/mainVirus.png", 100, 100, 50, 0, 0)
  self.scale = Vector(0.5, 0.5)
  self.width = self.width * self.scale.x * 0.7
  self.height = self.height * self.scale.y * 0.7
  self.origin = Vector(self.origin.x - self.width, self.origin.y - self.height)
  self.radius = self.width/2
end

function Enemy:update(dt)
  Enemy.super.update(self, dt)
  -- Movement
  
  for k, v in ipairs(actorList) do
    if v:is(Player) then
     p = v
    end
  end
  self.forward = (p.position - self.position)
  self.forward=self.forward:normalized()

  if self:checkCollision(p) then
    print("HAS PERDIDO")
  end
  --Launching

  -- Cooldown
  
end

function Enemy:draw()
  love.graphics.setColor(1,0,0.5)
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local rr = self.rot
  love.graphics.draw(self.image, xx, yy, rr, self.scale.x, self.scale.y, ox, oy)
  love.graphics.setColor(0,1,0)
  love.graphics.rectangle("line", xx, yy, self.width, self.height)
  love.graphics.setColor(1,1,1)
end

return Enemy
