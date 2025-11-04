Actor = Actor or require "lib/actor"
Enemy = Enemy or require "src/enemy"
Player = Player or require "src/player"
Spawner = Spawner or require "spawner"
Menu = Actor:extend()

function Menu:new(image)
    Menu.super.new(self, image, 0, 0, 0, 0, 0)
    self.image = love.graphics.newImage(image)
    self.startButton = {x = 450, y = 450, w = 100, h = 30}
    self.exitButton  = {x = 450,  y = 500,  w = 100, h = 30}
end

function Menu:draw()
    love.graphics.draw(self.image, 0, 0)
    self:drawButtons(false)
end

function Menu:update(dt)
    self:click(mouse) 
end

function Menu:drawButtons()
    love.graphics.setColor(0,0,0,1)
    love.graphics.rectangle("fill", self.startButton.x, self.startButton.y, self.startButton.w, self.startButton.h)
    love.graphics.rectangle("fill", self.exitButton.x,  self.exitButton.y,  self.exitButton.w,  self.exitButton.h)
    love.graphics.setColor(1,1,1,1)

    love.graphics.print("Start", self.startButton.x + 10, self.startButton.y)
    love.graphics.print("Exit", self.exitButton.x + 10, self.exitButton.y)

end

function Menu:click(mouse) -- ver si el usuario esta clicando yupii  
    x, y = love.mouse.getPosition( )

    if love.mouse.isDown(1) and self:clickedStart(x,y) then
        
        for i = 1, #actorList, 1 do
            if (actorList[i] ~= nil) then
                if (actorList[i]:is(Menu)) then
                    table.remove(actorList, i)
      
                end
            end
        end

        local s = Player()
        table.insert(actorList,s)
        local e = Enemy()
        table.insert(actorList,e)
        local sp = Spawner(5, 2)
        table.insert(actorList,sp)
    end
end

function Menu:clickedStart(x, y)
    return x > self.startButton.x and x < self.startButton.x + self.startButton.w and
           y > self.startButton.y and y < self.startButton.y + self.startButton.h  
end

function Menu:clickedExit(x, y)
    return x > self.exitButton.x and x < self.exitButton.x + self.exitButton.w and
           y > self.exitButton.y and y < self.exitButton.y + self.exitButton.h
end

return Menu