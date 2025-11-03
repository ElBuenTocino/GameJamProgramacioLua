local Vector = Vector or require "lib/vector"
local Actor = Actor or require "lib/actor"
local Menu = Menu or require "src/menu"
Game = Game or require "game"

math.randomseed(os.time())

local game

actorList = {}

function love.load() -- cambiar por sus clases
  m = Menu("src/Menu.png")
  table.insert(actorList,m)
  -- llamar al game 
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
