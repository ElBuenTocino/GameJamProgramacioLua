Vector = Vector or require "lib/vector"
Object = Object or require "lib/classic"

local Actor = Object:extend()

function Actor:new(image,x,y,speed,fx,fy)
    self.position = Vector(x or 0, y or 0)
    self.scale = Vector(1,1)
    self.forward = Vector(fx or 1,fy or 0)
    self.speed = speed or 30
    self.rot = 0
    self.image = love.graphics.newImage(image or "src/fondo.jpeg")
    self.origin = Vector(self.image:getWidth()/2 ,self.image:getHeight()/2)
    self.height = self.image:getHeight()
    self.width  = self.image:getWidth()
end

function Actor:update(dt)
  self.position = self.position + self.forward * self.speed * dt
end

function Actor:draw()
end

function Actor.dist(a,b)
  v=b.position - a.position
  return v:len()
end

function Actor:checkCollision(aa)
  local a_left = aa.position.x
  local a_right = aa.position.x + aa.width
  local a_top = aa.position.y
  local a_bottom = aa.position.y + aa.height
  local b_left = self.position.x
  local b_right = self.position.x + self.width
  local b_top = self.position.y
  local b_bottom = self.position.y + self.height

  if a_right > b_left and a_left < b_right and a_bottom > b_top and a_top < b_bottom then
    return true
  else
    return false
  end
end

return Actor