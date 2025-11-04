local Vector = Vector or require "lib/vector"
local Actor = Actor or require "lib/actor"
local Player = Player or require "src/player"
local Enemy = Enemy or require "src/enemy"
local Foco = Foco or require "src/foco"
local Spawner = Spawner or require "spawner"
local Menu = Menu or require "src/menu"

math.randomseed(os.time())

actorList = {}

function love.load()
  local m = Menu("src/Menu.png")
  table.insert(actorList,m)
  

  local score = 0
  -- el resto esta dentro de Menu
end

function love.update(dt)
  for k, v in ipairs(actorList) do
    v:update(dt)
    if v.points ~= nil then 
      score = v.points
      score = math.floor(score + 0.5)
    end
  end
end

function love.draw()
  love.graphics.print("Points: " .. tostring(score),10,10)
  for k, v in ipairs(actorList) do
    v:draw()
  end
end
