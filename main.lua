Vector = Vector or require "lib/vector"
Actor = Actor or require "lib/actor"
Player = Player or require "src/player"
Enemy = Enemy or require "src/enemy"
Foco = Foco or require "src/foco"
Spawner = Spawner or require "spawner"
Menu = Menu or require "src/menu"
WinScreen = WinScreen or require "src/winScreen"
LoseScreen = LoseScreen or require "src/loseScreen"

math.randomseed(os.time())

actorList = {}
time = 0
local timerstop = false
local boolEnd = true

function love.load()
  local m = Menu("src/Textura/fondoMenu.jpg")
  table.insert(actorList,m)  

  score = 0
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
  if (not timerstop) then
  time = time + dt
  end
end

function love.draw()
  love.graphics.print("Points: " .. tostring(score),10,10)
  for k, v in ipairs(actorList) do
    v:draw()
  end
end

function EmptyActorList()
  for i = 1, #actorList, 1 do
    actorList[i] = nil
  end
end

function WinScreenAppear()
  if (boolEnd) then
    timerstop = true
    EmptyActorList()
    wscr = WinScreen("src/Textura/fondo.jpeg")
    table.insert(actorList, wscr)
    boolEnd = false
  end
end

function LoseScreenAppear()
  if (boolEnd) then
    timerstop = true
    EmptyActorList()
    lscr = LoseScreen("src/Textura/fondo.jpeg")
    table.insert(actorList, lscr)
    boolEnd = false
  end
end
