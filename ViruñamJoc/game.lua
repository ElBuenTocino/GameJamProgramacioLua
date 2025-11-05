Actor = Actor or require "lib/actor"
Menu = Menu or require "menu"

Game = Actor:extend() -- La clase game s'ocupara de fer tots els updates, els clics i el guardar els punts

function Game:new()
    Game.super.new(self)
    -- self.title = title
    self.state = "menu"
    self.menu = love.graphics.newImage("src/Menu.png")
    font = love.graphics.newFont(24)
end

function Game:start()
    self.board = Board(self.data)
    self.state = "playing"
end

function Game:update(dt) -- Aquest update funciona per cridar a altres updates depenent del estat (per tant no ens ha fet falta un actorList)
    if self.state == "menu" then
        self.menu:update(dt)
    elseif self.state == "playing" then
        self.board:update(dt)
        if self.board:isComplete() then
            self.state = "won"
            self:saveScore()
        end
    end
end

function Game:draw()
    love.graphics.setFont(font)
    love.graphics.setColor(1,1,1,1)

    if self.state == "menu" then
        self.menu:draw()

    elseif self.state == "playing" then
        self.board:draw()
        love.graphics.setColor(0,0.2,0,0.4)
        love.graphics.rectangle("fill",1035,0,245,800)
        love.graphics.setColor(1,1,1,1)
        love.graphics.print(self.title, 1060, 20)
        love.graphics.print("Pairs: " .. self.board.pairs, 1060, 260)
        love.graphics.print("Moves: " .. self.board.moves, 1060, 560)
    end
end

function Game:click(x, y)
    if self.state == "menu" then
        if self.menu:clickedStart(x, y) then
            self:start()
        elseif self.menu:clickedExit(x, y) then
            love.event.quit()
        end

    elseif self.state == "playing" then
        self.board:click(x, y)
    end
end

return Game