Actor = Actor or require "lib/actor"
Vector = Vector or require "lib/vector"
Player = Player or require "src/player"
local Enemy = Actor:extend()
local p = nil
local changeDir = false
local w,h = love.graphics.getDimensions()

function Enemy:new()
  Enemy.super.new(self, "src/Textura/virus_malo.png", 100, 100, 50, 0, 0)
  self.scale = Vector(0.5, 0.5)
  self.width = self.width * self.scale.x * 0.6
  self.height = self.height * self.scale.y * 0.6
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

  if(self.position.x <= 0 or self.position.x >= w) then
    self.forward.x = 0
  end
  if(self.position.y <= 0 or self.position.y >= h) then
    self.forward.y = 0
  end

  if not p.canEatEnemy then
    self.forward = (p.position - self.position)
    self.forward=self.forward:normalized()
  else
    if not changeDir then
      self.forward = self.forward * -1
      changeDir = true
    end
  end
  if self:checkCollision(p) then
    if not p.canEatEnemy then
      print("HAS PERDIDO")
    else
      -- WIN --
      for k, v in ipairs(actorList) do
        if v == self then 
            table.remove(actorList, k) 
        end 
      end 
    end
  end
  --Launching

  -- Cooldown
  
end

function Enemy:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local rr = self.rot
  if p.canEatEnemy then
    love.graphics.setColor(0.2,1,1);
  else
    love.graphics.setColor(1,1,1);
  end
  love.graphics.draw(self.image, xx, yy, rr, self.scale.x, self.scale.y, ox, oy)
  love.graphics.setColor(0,1,0)
  love.graphics.rectangle("line", xx, yy, self.width, self.height)
  love.graphics.setColor(1,1,1)
end

return Enemy
