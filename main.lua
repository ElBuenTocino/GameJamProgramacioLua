local Vector = Vector or require "lib/vector"
local Actor = Actor or require "lib/actor"
local Player = Player or require "src/player"
local Enemy = Enemy or require "src/enemy"
local Foco = Foco or require "src/foco"
local Spawner = Spawner or require "spawner"

math.randomseed(os.time())

actorList = {}

function love.load()
  local s = Player()
  table.insert(actorList,s)
  local e = Enemy()
  table.insert(actorList,e)
  -- local fo = Foco()
  -- table.insert(actorList, fo)
  local sp = Spawner(5, 2)
  table.insert(actorList,sp)
end

function love.update(dt)
  for k, v in ipairs(actorList) do
    v:update(dt)
  end
end

function love.draw()
  love.graphics.print("Number astro eliminated: "..tostring(score),10,10)
  for k, v in ipairs(actorList) do
    v:draw()
  end
end
