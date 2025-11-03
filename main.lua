local Vector = Vector or require "lib/vector"
local Actor = Actor or require "lib/actor"
local Spawner = Spawner or require "src/spawner"

math.randomseed(os.time())

actorList = {}

function love.load()
  local s = Ship()
  table.insert(actorList,s)
  local sp = Spawner(true)
  table.insert(actorList,sp)
end

function love.update(dt)
  for , v in ipairs(actorList) do
    v:update(dt)
  end
end

function love.draw()
  love.graphics.print("Number astro eliminated: "..tostring(score),10,10)
  for , v in ipairs(actorList) do
    v:draw() 
  end

end