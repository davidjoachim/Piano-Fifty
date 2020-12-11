PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.score = 0
    self.timer = 30
    self.playedTimerSound = 3
    self.keymap = {"a", "s", "d", "f", "j", "k", "l", ";"}

    -- create tiles
    self.tiles = {}
    for y = 1, 4 do
        self.tiles[y] = Tile()
    end

    Timer.every(1, function()
        self.timer = self.timer - 1
    end)
end

function PlayState:update(dt)
    Timer.update(dt)
    if self.timer <= self.playedTimerSound then

        -- end game
        if self.playedTimerSound == 0 then
            gSounds['blip-high']:setVolume(0.75)
            gSounds['blip-high']:play()
            gStateMachine:change('score', {
                score = self.score,
                message = 'Times Up!'
            })

        -- countdown to game end
        else
            gSounds['blip']:setVolume(0.75)
            gSounds['blip']:play()
            self.playedTimerSound = self.playedTimerSound - 1
        end
    end

    for keyPosition, key in pairs(self.keymap) do
        if love.keyboard.wasPressed(key) then

            -- correct key
            if keyPosition == self.tiles[#self.tiles].position then
                love.audio.stop()
                gSounds['piano-' .. keyPosition]:play()
                table.remove(self.tiles)
                table.insert(self.tiles, 1, Tile())
                self.score = self.score + 1

            -- wrong key
            else
                gSounds['piano-wrong-note']:play()

                -- end game
                gStateMachine:change('score', {
                    score = self.score,
                    message = 'Wrong Key!'
                })
            end
        end
    end
end

function PlayState:render()
    for y, tile in pairs(self.tiles) do
        for x = 1, 8 do

            -- switch between white and black tile color
            if tile.position == x then
                love.graphics.setColor(0, 0, 0)
            else
                love.graphics.setColor(1, 1, 1)
            end

            -- tiles
            love.graphics.rectangle(
                'fill',
                (x - 1) * TILE_SIZE,
                (y - 1) * TILE_SIZE,
                TILE_SIZE - 1,
                TILE_SIZE - 1
            )

            -- tile border line grid
            love.graphics.setColor(0, 0, 0)
            love.graphics.rectangle(
                'line',
                (x - 1) * TILE_SIZE,
                (y - 1) * TILE_SIZE,
                TILE_SIZE,
                TILE_SIZE
            )
        end
    end

    -- red tile divider line
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle('fill', (TILE_SIZE * 4) - 2, 0, 4, TILE_SIZE * 4)

    -- display key names below tiles
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle('fill', 0, TILE_SIZE * 4, VIRTUAL_WIDTH, TILE_SIZE / 2)
    love.graphics.setFont(gFonts['mediumFont'])
    love.graphics.setColor(0, 0, 0)
    love.graphics.print('A', 30, 258)
    love.graphics.print('S', 92, 258)
    love.graphics.print('D', 156, 258)
    love.graphics.print('F', 220, 258)
    love.graphics.print('J', 284, 258)
    love.graphics.print('K', 348, 258)
    love.graphics.print('L', 414, 258)
    love.graphics.print(';', 478, 258)

    -- display score
    love.graphics.setFont(gFonts['mediumFont'])
    love.graphics.setColor(0.5, 0.5, 0.5)
    love.graphics.print('Score: ' .. tostring(self.score), 23, 16)

    -- display timer
    love.graphics.setFont(gFonts['mediumFont'])
    love.graphics.setColor(0.5, 0.5, 0.5)
    love.graphics.print('Timer: ' .. tostring(self.timer), VIRTUAL_WIDTH - 100, 16)
end