local Actor = Actor or require "lib/actor"
local Vector = Vector or require "lib/vector"
local Food = Actor:extend()

local w, h = love.graphics.getDimensions()


function Food:new()
  Food.super.new(self, "src/comida.png", 0, 0, 100, 0, 0)
  self.scale = Vector(0.09, 0.09)
  self.width = self.width * self.scale.x * 0.7
  self.height= self.height * self.scale.y * 0.7
  Foco.super.new(self, "src/comida.png", love.math.random(0+self.width, w-self.width), love.math.random(0+self.height, h-self.height), 0)
  self.scale = Vector(0.09, 0.09)
  self.width = self.width * self.scale.x * 0.7
  self.height= self.height * self.scale.y * 0.7
  self.origin = Vector(self.origin.x - self.width*5, self.origin.y - self.height*5)
end

function Food:update(dt)

end

function Food:draw()
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

return Food
