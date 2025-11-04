local Vector = Vector or require "lib/vector"
local Actor = Actor or require "lib/actor"
local Player = Player or require "src/player"
local Enemy = Enemy or require "src/enemy"
local Foco = Foco or require "src/foco"
local Spawner = Spawner or require "spawner"

math.randomseed(os.time())

actorList = {}
local timer=0
local cd=3
local firstFocus=false
local currentSpawners=1
local playerIndex=0
function love.load()
    local s = Player()
  table.insert(actorList,s)
  local e = Enemy()
  table.insert(actorList,e)
  local sp = Spawner(13, 2)
  table.insert(actorList,sp)
end

function love.update(dt)
  for k, v in ipairs(actorList) do
    v:update(dt)
    if v:is(Player) then playerIndex=k end --para coger los puntos de player 
  end
  timer=timer+dt
  if timer>=cd and not firstFocus then
  local fo = Foco()
  table.insert(actorList, fo)
  firstFocus=true
  end
  local desiredSpawners= (3)--playerIndex.points/10)+1 --el +1 es pk ya tenemos un spawner, entonces si empieza en 0 generaria otro, la otra opcion seria no instanciar uno primero y dejar que lo haga esta funcion como querais 
  --hay que cambiar la condicion en base al sistema de puntos por ejemplo cada 10 puntos 1 spawner o lo que sea
  if desiredSpawners>currentSpawners then 
     local newSpawner = Spawner(13,2)
     table.insert(actorList, newSpawner)
     currentSpawners=currentSpawners+1
  end
end

function love.draw()
  love.graphics.print("Number astro eliminated: "..tostring(score),10,10)
  for k, v in ipairs(actorList) do
    v:draw()
  end

end