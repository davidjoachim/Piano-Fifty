-- https://github.com/vrld/hump/blob/master/class.lua
Class = require 'lib/class'

-- https://github.com/Ulydev/push
push = require 'lib/push'

-- https://github.com/airstruck/knife/blob/master/knife/timer.lua
Timer = require 'lib/knife.timer'

require 'src/StateMachine'
require 'src/constants'
require 'src/Tile'

require 'src/states/BaseState'
require 'src/states/CountdownState'
require 'src/states/PlayState'
require 'src/states/ScoreState'
require 'src/states/TitleScreenState'

gSounds = {
    ['piano-1'] = love.audio.newSource('sounds/1.wav', 'static'),
    ['piano-2'] = love.audio.newSource('sounds/2.wav', 'static'),
    ['piano-3'] = love.audio.newSource('sounds/3.wav', 'static'),
    ['piano-4'] = love.audio.newSource('sounds/4.wav', 'static'),
    ['piano-5'] = love.audio.newSource('sounds/5.wav', 'static'),
    ['piano-6'] = love.audio.newSource('sounds/6.wav', 'static'),
    ['piano-7'] = love.audio.newSource('sounds/7.wav', 'static'),
    ['piano-8'] = love.audio.newSource('sounds/8.wav', 'static'),
    ['piano-wrong-note'] = love.audio.newSource('sounds/wrong_note.wav', 'static'),
    ['blip'] = love.audio.newSource('sounds/blip.wav', 'static'),
    ['blip-high'] = love.audio.newSource('sounds/blip_high.wav', 'static'),

    -- https://soundcloud.com/stevenobrien/staring-at-the-clock
    ['music'] = love.audio.newSource('sounds/staringattheclock.mp3', 'static')
}

gTextures = {
    -- https://videohive.net/item/musical-clean-piano-background/5171939
    ['background'] = love.graphics.newImage('graphics/background.png')
}

gFonts = {
    ['smallFont'] = love.graphics.newFont('fonts/sans.ttf', 8),
    ['mediumFont'] = love.graphics.newFont('fonts/sans.ttf', 18),
    ['largeFont'] = love.graphics.newFont('fonts/sans.ttf', 24),
    ['hugeFont'] = love.graphics.newFont('fonts/sans.ttf', 56),
    ['pianoFont'] = love.graphics.newFont('fonts/piano.ttf', 28)
}