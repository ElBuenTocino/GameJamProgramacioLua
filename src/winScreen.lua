Actor = Actor or require "lib/actor"
Enemy = Enemy or require "src/enemy"
Player = Player or require "src/player"
Spawner = Spawner or require "spawner"
WinScreen = Actor:extend()

function WinScreen:new(image)
    WinScreen.super.new(self, image, 0, 0, 0, 0, 0)
    self.image = love.graphics.newImage(image)
    self.startButton = {x = 450, y = 450, w = 100, h = 30}
    self.exitButton  = {x = 450,  y = 500,  w = 100, h = 30}
end

function WinScreen:draw()
    love.graphics.draw(self.image, 0, 0)
    self:drawButtons(false)

    love.graphics.print("YOU ATE THE VIRUS AND WON!!", 570, 300)
    love.graphics.print("You got " .. tostring(score) .. " points", 530, 350)
    love.graphics.print("And beat the game in " .. tostring(math.floor(time + 0.5)) .. " seconds!", 490, 350)
end

function WinScreen:update(dt)
    self:click(mouse) 
end

function WinScreen:drawButtons()
    love.graphics.setColor(0,0,0,1)
    love.graphics.rectangle("fill", self.startButton.x, self.startButton.y, self.startButton.w, self.startButton.h)
    love.graphics.rectangle("fill", self.exitButton.x,  self.exitButton.y,  self.exitButton.w,  self.exitButton.h)
    love.graphics.setColor(1,1,1,1)

    love.graphics.print("Restart", self.startButton.x + 10, self.startButton.y)
    love.graphics.print("Exit", self.exitButton.x + 10, self.exitButton.y)

end

function WinScreen:click(mouse) -- ver si el usuario esta clicando yupii  
    x, y = love.mouse.getPosition( )

    if love.mouse.isDown(1) and self:clickedRestart(x,y) then
       love.event.quit("restart")
    end

    if love.mouse.isDown(1) and self:clickedExit(x,y) then
        love.event.quit()
    end

end

function WinScreen:clickedRestart(x, y)
    return x > self.startButton.x and x < self.startButton.x + self.startButton.w and
           y > self.startButton.y and y < self.startButton.y + self.startButton.h  
end

function WinScreen:clickedExit(x, y)
    return x > self.exitButton.x and x < self.exitButton.x + self.exitButton.w and
           y > self.exitButton.y and y < self.exitButton.y + self.exitButton.h
end

return WinScreen