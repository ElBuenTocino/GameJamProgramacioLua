local Vector = Vector or require "lib/vector"
local Actor = Actor or require "lib/actor"
local Player = Player or require "player"
-- local Spawner = Spawner or require "src/spawner"

math.randomseed(os.time())

actorList = {}

function love.load()
  local s = Player()
  table.insert(actorList,s)
--   local sp = Spawner(true)
--   table.insert(actorList,sp)
end

function love.update(dt)
  for k, v in ipairs(actorList) do
    v:update(dt)
  end
end
--fjdfcws
function love.draw()
  love.graphics.print("Number astro eliminated: "..tostring(score),10,10)
  for k, v in ipairs(actorList) do
    v:draw()
  end

end