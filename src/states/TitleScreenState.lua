TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:update(dt)

    -- transition to countdown state when enter/return is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gSounds['music']:stop()
        gStateMachine:change('countdown')
    end
end

function TitleScreenState:render()
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(gFonts['pianoFont'])
    love.graphics.printf('Piano Fifty', 0, 70, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['mediumFont'])
    love.graphics.printf('Hit as many keys as possible in 30 seconds', 0, 120, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['largeFont'])
    love.graphics.printf('Press Enter', 0, 190, VIRTUAL_WIDTH, 'center')
end