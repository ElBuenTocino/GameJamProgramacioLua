Actor = Actor or require "lib/actor"
Vector = Vector or require "lib/vector"
Foco = Foco or require "src/foco"
Food = Food or require "src/food"

local Spawner = Actor:extend()

function Spawner:new(_time, _objSpawner)
  self.tActual = 0
  self.tFinal = _time or 5
  self.loop = true
  self.obj = _objSpawner
end

function Spawner:update(dt)
  self.tActual = self.tActual + dt
  if self.tActual > self.tFinal then
    self:trigger()
    if self.obj == 1 and self:checkNumFood() <= 20 then
        local f = Food()
        table.insert(actorList, f)
    elseif self.obj == 2 then
        local e = Foco()
        table.insert(actorList, e)
        print("foco")
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

function Spawner:checkNumFood()
  local num = 0
  for k,v in pairs(actorList) then
    if v:is(Food) then num = num + 1 end
  end
  return num

end

function Spawner:draw()
end

return Spawner
