local Actor = Actor or require "lib/actor"
local Vector = Vector or require "lib/vector"
local Player = Actor:extend()

function Player:new()
  Player.super.new(self, "src/mainVirus.png", 180, 540, 100, 0, 0)
  self.scale = Vector(0.1, 0.1)
  self.XFor = 0
  self.YFor = 0
end

function Player:update(dt)
  Player.super.update(self, dt)
  self.XFor = 0
  self.YFor = 0

  if (love.keyboard.isDown("a")) then
    self.XFor = -1
  end

  if (love.keyboard.isDown("d")) then
    self.XFor = 1
  end

  if (love.keyboard.isDown("s")) then
    self.YFor = 1
  end

  if(love.keyboard.isDown("w")) then
    self.YFor = -1
  end

  self.forward = Vector(self.XFor, self.YFor)
end

function Player:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local rr = self.rot
  love.graphics.draw(self.image, xx, yy, rr, self.scale.x, self.scale.y, ox, oy)
end

return Player
