local Vector = Vector or require "lib/vector"
local Actor = Actor or require "lib/actor"
local Player = Player or require "src/player"
local Foco = Foco or require "src/foco"
-- local Spawner = Spawner or require "src/spawner"

math.randomseed(os.time())

actorList = {}

function love.load()
  local fo = Foco()
  table.insert(actorList, fo)
  --local s = Player()
  --table.insert(actorList,s)
--   local sp = Spawner(true)
--   table.insert(actorList,sp)
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