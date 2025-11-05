local Actor = Actor or require "lib/actor"
local Vector = Vector or require "lib/vector"

local Food = Actor:extend()

local w, h = love.graphics.getDimensions()

local foodsprites = {
  "src/Textura/01.png",
  "src/Textura/02.png",
  "src/Textura/03.png",
  "src/Textura/04.png",
  "src/Textura/05.png",
  "src/Textura/06.png"
}

local numAlea = 0

function Food:new()
  numAlea = love.math.random(1,100)
  -- print(numAlea)
  if (numAlea >= 1 and numAlea < 60) then
    self.pointsGained = 1
    self.sprite = foodsprites[math.random(1, 2)]
    self.scale_ = 0.7
  elseif (numAlea >= 60 and numAlea < 90) then
    self.pointsGained = 2
    self.sprite = foodsprites[math.random(3, 4)]
    self.scale_ = 1
  else
    self.pointsGained = 3
    self.sprite = foodsprites[math.random(5, 6)]
    self.scale_ = 1.2
  end
  local x = love.math.random(0, w)
  local y = love.math.random(0, h)
  Food.super.new(self, self.sprite, x, y, 0)
  self.scale = Vector(self.scale_, self.scale_)
  self.width  = self.image:getWidth()  * self.scale.x
  self.height = self.image:getHeight() * self.scale.y
  self.origin = Vector(self.width / 2, self.height / 2)
  
end

function Food:update(dt)
end

function Food:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(
    self.image,
    self.position.x,
    self.position.y,
    self.rot or 0,
    self.scale.x,
    self.scale.y,
    self.origin.x,
    self.origin.y
  )
end

return Food
