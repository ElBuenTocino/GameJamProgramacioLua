Actor = Actor or require "lib/actor"
Vector = Vector or require "lib/vector"

local Spawner = Actor:extend()


function Spawner:new(_time, _objSpawner)
  self.tActual = 0
  self.tFinal = _time or 5
  self.loop = true
end

function Spawner:update(dt)
  self.tActual = self.tActual + dt
  if self.tActual > self.tFinal then
    self:trigger()
    if _objSpawner == 1 then
        local f = Food()
        table.insert(actorList, f)
    elseif _objSpawner == 2 then
        local e = Enemy()
        table.insert(actorList, e)
    end 
    if self.loop then
      self.tActual = 0
    else
      for k, v in pairs(actorList) do
        if v == self then
          table.remove(actorList, k)
          break
        end
      end
    end
  end
end

function Spawner:trigger()
  print("hola")
end

function Spawner:draw()
end

return Spawner
