local Vector = Vector or require "lib/vector"
local Actor = Actor or require "lib/actor"
local Player = Player or require "src/player"
-- local Spawner = Spawner or require "src/spawner"
local Food = Food or require "src/food"

math.randomseed(os.time())

actorList = {}

function love.load()
  local s = Player()
  table.insert(actorList,s)
  local f = Food()
  table.insert(actorList,f)
--   local sp = Spawner(true)
--   table.insert(actorList,sp)
end

function love.update(dt)
  for k, v in ipairs(actorList) do
    v:update(dt)
  end
end

function love.draw()
  for k, v in ipairs(actorList) do
    v:draw()
  end
end