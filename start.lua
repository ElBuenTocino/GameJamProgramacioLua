Actor = Actor or require "resources/actor"

function Menu:new(image)
    Menu.super.new(self, image, 0, 0, 0, 0, 0)
    self.image = love.graphics.newImage(image)
    self.startButton = {x = data.window.startButtonX, y = data.window.startButtonY, w = 100, h = 30}
    self.exitButton  = {x = data.window.exitButtonX,  y = data.window.exitButtonY,  w = 100, h = 30}
end

function Menu:draw()
    love.graphics.draw(self.image, 0, 0)
    self:drawButtons(false)
end

function Menu:drawButtons()
    love.graphics.setColor(0,0,0,1)
    love.graphics.rectangle("fill", self.startButton.x, self.startButton.y, self.startButton.w, self.startButton.h)
    love.graphics.rectangle("fill", self.exitButton.x,  self.exitButton.y,  self.exitButton.w,  self.exitButton.h)
    love.graphics.setColor(1,1,1,1)
    if startButton then
        love.graphics.print("Start", self.startButton.x + 10, self.startButton.y)
    end
        love.graphics.print("Exit", self.exitButton.x + 10, self.exitButton.y)
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