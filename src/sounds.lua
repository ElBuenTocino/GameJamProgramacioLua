sounds = 
{
    menuMusic = love.audio.newSource("src/sounds/musicMenu.wav","stream"),
    mainMusic = love.audio.newSource("src/sounds/mainMusic.wav","stream"),
    hurtSound = nil,
    eatSound = love.audio.newSource("src/sounds/Eat.mp3","static"),
    enemySound = nil,
    focoSound = nil,
    dieSound = nil
    -- love.audio.play(sound)
}

return sounds