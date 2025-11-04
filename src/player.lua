Actor = Actor or require "lib/actor"
Vector = Vector or require "lib/vector"
Foco = Foco or require "src/foco"
Food = Food or require "src/food"
local Player = Actor:extend()
local e = nil

function Player:new()
  Player.super.new(self, "src/mainVirus.png", 180, 540, 130, 0, 0)
  self.baseWidth = self.width * 0.7
  self.baseHeight = self.height * 0.7
  self.scale = Vector(0.1, 0.1)
  self.points = 10
  self.canEatEnemy = false
  self:setSize()

  
end


function Player:update(dt)
  Player.super.update(self, dt)
  self.XFor = 0
  self.YFor = 0

  for k, v in ipairs(actorList) do
    if v:is(Enemy) then
      e = v
    end
  end

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

  if (self:isInLight()) then
    self:damageLight(dt)
  end

  if (self:isTouchingFood()) then
    self:eat()
  end

  if (self.points <= 0) then
    self:die()
  end
  if(self.baseWidth * 0.5 <= self.width) then
    self.canEatEnemy = true
  else
    self.canEatEnemy = false
  end
  self.forward = Vector(self.XFor, self.YFor)

end

function Player:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local rr = self.rot
  love.graphics.setColor(0,1,0)
  love.graphics.rectangle("line", xx, yy, self.width, self.height)
  love.graphics.setColor(1,1,1)
  love.graphics.draw(self.image, xx, yy, rr, self.scale.x, self.scale.y, ox, oy)
end

function Player:isInLight()
  for i = 1, #actorList, 1 do
    if (actorList[i]:is(Foco) and Vector.distance(actorList[i].position, self.position) <= 100) then
      print("isInLight")
      if(actorList[i].fixed) then
        return true
      end
    end
  end
  return false
end

function Player:isTouchingFood()
  for i = 1, #actorList, 1 do
    if (actorList[i] ~= nil) then
      if (actorList[i]:is(Food) and self:checkCollision(actorList[i])) then
        table.remove(actorList, i)
        return true
      end
    end
  end
  return false
end

function Player:eat()
  self.points = self.points + 1
  self:setSize()
end

function Player:getCollisionBounds()
  local scaledWidth = self.width * self.scale.x
  local scaledHeight = self.height * self.scale.y
  return self.position.x, self.position.y, scaledWidth, scaledHeight
end


function Player:setSize()
  self.scale = Vector(self.points / 150, self.points / 150)
  self.width = self.baseWidth * self.scale.x
  self.height = self.baseHeight * self.scale.y
  self.origin = Vector(self.width / 2, self.height / 2)
end


function Player:damageLight(dt)
  self.points = self.points - 1.5 * dt
  self:setSize()
end

function Player:die()
  print("playerdie")
  for i = 1, #actorList, 1 do
    if (actorList[i] ~= nil) then
      if (actorList[i]:is(Player)) then
        table.remove(actorList, i)
      end
    end
  end
end

return Player
