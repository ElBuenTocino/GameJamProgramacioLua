local Actor = Actor or require "lib/actor"
local Vector = Vector or require "lib/vector"
local Foco = Foco or require "src/foco"
local Player = Actor:extend()

function Player:new()
  Player.super.new(self, "src/mainVirus.png", 180, 540, 100, 0, 0)
  self.scale = Vector(0.1, 0.1)
  self.XFor = 0
  self.YFor = 0
  self.points = 1
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

  if (Player.isInLight(self)) then
    Player.damageLight(self, dt)
  end

  if (self.points <= 0) then
    Player.die(self)
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

function Player:isInLight()
  for i = 1, #actorList, 1 do
    if (actorList[i]:is(Foco) and Vector.distance(actorList[i].position, self.position) <= 10) then
      return true
    else return false
    end
  end
end

function Player:damageLight(dt)
  self.points = self.points - 1 * dt
end

function Player:die()
  print("playerdie")
  for i = 1, #actorList, 1 do
    if (actorList[i]:is(Player)) then
      table.remove(actorList, i)
    end
  end
end

return Player
