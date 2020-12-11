ScoreState = Class{__includes = BaseState}

function ScoreState:enter(params)
    self.score = params.score
    self.message = params.message
end

function ScoreState:update(dt)

    -- go back to countdown state if enter/return is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(gFonts['pianoFont'])
    love.graphics.printf(self.message, 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['largeFont'])
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 115, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['mediumFont'])
    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end