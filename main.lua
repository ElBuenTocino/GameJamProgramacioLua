local Vector = Vector or require "lib/vector"
local Actor = Actor or require "lib/actor"
local Player = Player or require "src/player"
local Enemy = Enemy or require "src/enemy"
local Foco = Foco or require "src/foco"
local Spawner = Spawner or require "spawner"
Food = Food or require "src/food"

math.randomseed(os.time())

actorList = {}

function love.load()
  local s = Player()
  table.insert(actorList,s)
  local e = Enemy()
  table.insert(actorList,e)
  local foo = Food()
  table.insert(actorList, foo)
  -- local fo = Foco()
  -- table.insert(actorList, fo)
  local sp = Spawner(5, 2)
  table.insert(actorList,sp)
  local sp2 = Spawner(1, 1)
  table.insert(actorList, sp2)
end

function love.update(dt)
  for k, v in ipairs(actorList) do
    v:update(dt)
  end
end

function love.draw()
  love.graphics.print("Points: "..tostring(score),10,10)
  for k, v in ipairs(actorList) do
    v:draw()
  end
end
