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

local scale = 0.7

function Food:new()
  local sprite = foodsprites[math.random(1, #foodsprites)]
  local x = love.math.random(0, w)
  local y = love.math.random(0, h)
  Food.super.new(self, sprite, x, y, 0)
  self.scale = Vector(scale, scale)
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

  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle(
    "line",
    self.position.x - self.origin.x,
    self.position.y - self.origin.y,
    self.width,
    self.height
  )
  love.graphics.setColor(1, 1, 1)
end

return Food
