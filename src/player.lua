local Actor = Actor or require "lib/actor"
local Vector = Vector or require "lib/vector"
local Foco = Foco or require "src/foco"
local Food = Food or require "src/food"
local Player = Actor:extend()


function Player:new()
  Player.super.new(self, "src/mainVirus.png", 180, 540, 130, 0, 0)
  self.scale = Vector(0.1, 0.1)
  self.XFor = 0
  self.YFor = 0
  self.points = 1
  self.width = self.width * self.scale.x * 0.7
  self.height= self.height * self.scale.y * 0.7
  self.origin = Vector(self.origin.x - self.width*5, self.origin.y - self.height*5)
end

function Player:update(dt)
  Player.super.update(self, dt)
  self.XFor = 0
  self.YFor = 0

  Player.setSize(self)

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

  if (Player.isInLight(self)) then
    Player.damageLight(self, dt)
  end

  if (self.isTouchingFood(self)) then
    print("touching food")
    Player.eat(self)
  end

  if (self.points <= 0) then
    Player.die(self)
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
    if (actorList[i]:is(Foco) and Vector.distance(actorList[i].position, self.position) <= 10) then
      return true
    else return false
    end
  end
end

function Player:isTouchingFood()
  for i = 1, #actorList, 1 do
    if (actorList[i] ~= nil) then
      if (actorList[i]:is(Food) and Player.super.checkCollision(self, actorList[i])) then
        table.remove(actorList, i)
        return true
      else return false
      end
    end
  end
end

function Player:eat()
  self.points = self.points + 1
end

function Player:setSize()
  self.scale = Vector(self.points/10, self.points/10)
  -- self.scale.x = self.points/10
  -- self.scale.y = self.points/10
end

function Player:damageLight(dt)
  self.points = self.points - 1 * dt
end

function Player:die()
  print("playerdie")
  for i = 1, #actorList, 1 do
    if (actorList[i]:is(Player)) then
      table.remove(actorList, i)
    end
  end
end

return Player
