--------INCLUDES--------
push = require 'libraries/push'
Class = require 'libraries/class'
require 'libraries/StateMachine'


--------CONSTANTS--------
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288


--------VARIABLES--------
highScore = 0


function love.load()

    --setup the display
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('PacMan Clone')
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    --define the fonts

    --[[ BCOBB: These fonts are from my Flappy Bird clone from CS50. I should find a new font for the PacMan game. Something retro and cool, I think.
    smallFont = love.graphics.newFont('resources/fonts/font.ttf', 8)
    mediumFont = love.graphics.newFont('resources/fonts/flappy.ttf', 14)
    lolFont = love.graphics.newFont('resources/fonts/flappy.ttf', 10)
    flappyFont = love.graphics.newFont('resources/fonts/flappy.ttf', 28)
    hugeFont = love.graphics.newFont('resources/fonts/flappy.ttf', 56)
    love.graphics.setFont(flappyFont)
    ]]--

    --define the sounds table

    --[[ BCOBB: These sounds are also from the Flappy Bird clone. Find or make new sound files to use for this game!
    sounds = {
        ['jump'] = love.audio.newSource('resources/sounds/jump.wav', 'static'),
        ['explosion'] = love.audio.newSource('resources/sounds/explosion.wav', 'static'),
        ['hurt'] = love.audio.newSource('resources/sounds/hurt.wav', 'static'),
        ['score'] = love.audio.newSource('resources/sounds/score.wav', 'static'),
        ['music'] = love.audio.newSource('resources/music/marios_way.mp3', 'static'),
    }
    sounds['music']:setLooping(true)
    sounds['music']:play()
    ]]--

    --set state machines

    --[[ BCOBB: Haven't defined the game's states yet. As I get further into development, I think I will.
    gStateMachine = StateMachine {
        ['title'] = function() return TitleScreenState() end,
        ['play'] = function() return PlayState() end,
        ['score'] = function() return ScoreState() end,
        ['countdown'] = function() return CountdownState() end
    }
    gStateMachine:change('title')
    ]]--


    --set random seed based on system time
    math.randomseed(os.time())

    --define keysPressed table
    love.keyboard.keysPressed = {}
end


function love.resize(w, h)
    push:resize(w, h)
end


function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
    if key == 'escape' then
        love.event.quit()
    end
end



function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end



function love.update(dt)
    --gStateMachine:update(dt)
    love.keyboard.keysPressed = {}
end



function love.draw() 
    push:start()    
    --gStateMachine:render()
    push:finish()
end