Actor = Actor or require "lib/actor"
Vector = Vector or require "lib/vector"

local Foco = Actor:extend()


local w, h = love.graphics.getDimensions()

function Foco:new()
  self.rot = math.pi
  self.radius = 120
  self.alfa = 0.5
  self.count = 0
  self.timer = 0
  self.fixed = false
  self.transparent =
  Foco.super.new(self, "src/mainVirus.png", love.math.random(0+self.radius, w-self.radius), love.math.random(0+self.radius, h-self.radius), 0)
end

function Foco:update(dt)
  Foco.super.update(self, dt)

  if self.count == 8 then
    self.fixed = true
  end 
  if not self.fixed then
    self:FlickeringLight(dt)
  else 
    self:Fix(dt)
  end 

end

function Foco:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local rr = self.rot
  love.graphics.setColor(1,1,0.5, self.alfa)
  -- love.graphics.draw(self.image, xx, yy, rr, 1, 1, ox, oy)
  love.graphics.circle("fill", xx, yy, self.radius)
  love.graphics.setColor(1,1,1, 1)
end

function Foco:FlickeringLight(dt)
    
    if self.transparent then
        self.alfa = self.alfa + dt
    else    
        self.alfa = self.alfa - dt
    end
    
    if self.alfa >= 0.5 then 
        self.transparent = false
        self.count = self.count + 1
    elseif self.alfa <= 0 then 
        self.transparent = true
        self.count = self.count + 1
    end 
    
end 

function Foco:Fix(dt)
     self.timer = self.timer + dt 
     self.alfa = 0.5

     if self.timer > 4 then 
        for k, v in ipairs(actorList) do
            if v == self then 
                table.remove(actorList, k) 
            end 
        end 
        self.timer = 0
     end     
end 

return Foco
