local Actor = Actor or require "lib/actor"
local Vector = Vector or require "lib/vector"
local Ship = Actor:extend()

function Ship:new()
  Ship.super.new(self, "src/textures/spaceShips_001.png", 180, 540, 100, 0, 0)
end

function Ship:update(dt)
  Ship.super.update(self, dt)
  -- Movement
  if (love.keyboard.isDown("a") and self.position.x > 0 + self.image:getWidth()/2) then
    self.forward = Vector(-1, 0)

  elseif (love.keyboard.isDown("d") and self.position.x < 360  - self.image:getWidth()/2) then
    self.forward = Vector(1, 0)

  elseif (self.position.x < 0 + self.image:getWidth()/2 or self.position.x > 360  - self.image:getWidth()/2) then
    self.forward = Vector(0,0)
  end

  --Launching
  if (love.keyboard.isDown("space") and self.canShoot) then
    local b = Bullet(self.position.x, self.position.y + 10)
    table.insert(actorList, b)
    self.canShoot = false
  end

  -- Cooldown
  if (self.canShoot == false) then
    self.timer = self.timer + dt
    if (self.timer >= self.shootCooldown) then
      self.timer = 0
      self.canShoot = true
    end
  end  
end

function Ship:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local rr = self.rot
  love.graphics.draw(self.image, xx, yy, rr, 1, 1, ox, oy)
end

--hola

return Ship
