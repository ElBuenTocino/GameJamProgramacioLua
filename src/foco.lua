Actor = Actor or require "lib/actor"
Vector = Vector or require "lib/vector"

local Foco = Actor:extend()

local timer = 0
local transparent = false
local count = 0
local fixed = false
local alfa = 1

function Foco:new()
  Foco.super.new(self, "src/mainVirus.png", love.math.random(0, 1000), love.math.random(0, 750), 0)
  self.rot = math.pi
end

function Foco:update(dt)
  Foco.super.update(self, dt)

  if count == 4 then
    fixed = true
  end 
   print(count)
  if not fixed then
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
  love.graphics.setColor(1,1,1, alfa)
  love.graphics.draw(self.image, xx, yy, rr, 1, 1, ox, oy)
  love.graphics.setColor(1,1,1, 1)
end

function Foco:FlickeringLight(dt)
    
    if transparent then
        alfa = alfa + 1*dt
    else    
        alfa = alfa - 1*dt
    end
    
    if alfa >= 1 then 
        transparent = false
        count = count + 1

    elseif alfa <= 0 then 
        transparent = true
        count = count + 1

    end 
    
end 

function Foco:Fix(dt)
     timer = timer + dt 
     alfa = 1

     if timer > 4 then 
        for k, v in ipairs(actorList) do
            if v == self then 
                table.remove(actorList, k) 
            end 
        end 
        timer = 0
     end     
end 

return Foco
