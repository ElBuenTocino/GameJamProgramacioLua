local Actor = Actor or require "lib/actor"
local Vector = Vector or require "lib/vector"
local Player = Actor:extend()

function Player:new()
  Player.super.new(self, "src/textures/spaceShips_001.png", 180, 540, 100, 0, 0)
end

function Player:update(dt)
  Player.super.update(self, dt)
  -- Movement
  if (love.keyboard.isDown("a") and self.position.x > 0 + self.image:getWidth()/2) then
    self.forward = Vector(-1, self.forward.y)

  elseif (love.keyboard.isDown("d") and self.position.x < 800  - self.image:getWidth()/2) then
    self.forward = Vector(1, self.forward.y)

  elseif (love.keyboard.isDown("s")) then
    self.forward = Vector(self.forward.x, -1)

  elseif(love.keyboard.isDown("w")) then
    self.forward = Vector(self.forward.x, 1)
  end 
end

function Player:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local rr = self.rot
  love.graphics.draw(self.image, xx, yy, rr, 1, 1, ox, oy)
end

return Player
