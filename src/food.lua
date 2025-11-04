local Actor = Actor or require "lib/actor"
local Vector = Vector or require "lib/vector"
local Food = Actor:extend()

function Food:new()
  Food.super.new(self, "src/comida.png", 0, 0, 100, 0, 0)
end

function Food:update(dt)

end

function Food:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local rr = self.rot
  love.graphics.draw(self.image, xx, yy, rr, 0.09, 0.09, ox, oy)
end

return Food
