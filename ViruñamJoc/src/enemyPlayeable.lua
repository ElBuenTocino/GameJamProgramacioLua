Actor = Actor or require "lib/actor"
Vector = Vector or require "lib/vector"
Player = Player or require "src/player"
Sounds = Sounds or require "src/sounds"
local EnemyPlayeable = Actor:extend()
local p = nil
local changeDir = false
local w,h = love.graphics.getDimensions()

function EnemyPlayeable:new()
  EnemyPlayeable.super.new(self, "src/Textura/virus_malo.png", 500, 100, 60, 0, 0)
  self.scale = Vector(0.5, 0.5)
  self.width = self.width * self.scale.x * 0.6
  self.height = self.height * self.scale.y * 0.6
  self.origin = Vector(self.origin.x - self.width, self.origin.y - self.height)
  self.radius = self.width/2
end

function EnemyPlayeable:update(dt)
  EnemyPlayeable.super.update(self, dt)
  -- Movement
  -- get player
  for k, v in ipairs(actorList) do
    if v:is(Player) then
     p = v
    end
  end
  -- control
  self.forward = Vector( 0, 0)
  if (love.keyboard.isDown("left") and self.position.x > 0 - self.width/2) then
    self.forward.x = -1 
  end

  if (love.keyboard.isDown("right") and self.position.x < w - self.width/2) then
    self.forward.x = 1
  end

  if (love.keyboard.isDown("down") and self.position.y < h - self.height/2) then
    self.forward.y = 1
  end

  if(love.keyboard.isDown("up") and self.position.y > 0 - self.height/2) then
    self.forward.y = -1
  end

  --collision player
  if self:checkCollision(p) then
    if not p.canEatEnemyPlayeable then
      p.points = 0
    else
      love.audio.play(sounds.EnemyPlayeableSound)
      WinScreenAppear()
      for k, v in ipairs(actorList) do
        if v == self then 
            table.remove(actorList, k) 
        end 
      end 
    end
  end
  --Launching

  -- Cooldown
  
end

function EnemyPlayeable:draw()
  local xx = self.position.x
  local ox = self.origin.x
  local yy = self.position.y
  local oy = self.origin.y
  local rr = self.rot
  if p.canEatEnemyPlayeable then
    love.graphics.setColor(0.2,1,1);
  else
    love.graphics.setColor(1,1,1);
  end
  love.graphics.draw(self.image, xx, yy, rr, self.scale.x, self.scale.y, ox, oy)

end

return EnemyPlayeable
