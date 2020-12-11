CountdownState = Class{__includes = BaseState}

function CountdownState:init()
    self.timer = 3
    self.playedTimerSound = 3

    Timer.every(1, function()
        self.timer = self.timer - 1
    end)
end

function CountdownState:update(dt)
    Timer.update(dt)
    if self.timer <= self.playedTimerSound then

        -- start game
        if self.playedTimerSound == 0 then
            gSounds['blip-high']:setVolume(0.5)
            gSounds['blip-high']:play()
            gStateMachine:change('play')

        -- countdown to game start
        else
            gSounds['blip']:setVolume(0.5)
            gSounds['blip']:play()
            self.playedTimerSound = self.playedTimerSound - 1
        end
    end
end

function CountdownState:render()

    -- render countdown big in the middle of the screen
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(gFonts['hugeFont'])
    love.graphics.printf(tostring(self.timer), 0, 120, VIRTUAL_WIDTH, 'center')
end