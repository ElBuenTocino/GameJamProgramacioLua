sounds = 
{
    menuMusic = love.audio.newSource("src/sounds/mainMusic.wav","stream"),
    mainMusic = love.audio.newSource("src/sounds/musicMenu.wav","stream"),
    hurtSound = love.audio.newSource("src/sounds/hurt.wav","static"),
    eatSound = love.audio.newSource("src/sounds/Eat.mp3","static"),
    enemySound = nil,
    focoSound = nil,
    dieSound = love.audio.newSource("src/sounds/die.wav","static")
    -- love.audio.play(sound)
}

return sounds