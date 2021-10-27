function love.load()
    anim8 = require 'lib/anim8'

    love.graphics.setDefaultFilter("nearest", "nearest")

    player = {}
    player.x = 0
    player.y = 0
    player.speed = 3
    player.sprite_sheet = love.graphics.newImage('sprites/player.png')
    player.grid = anim8.newGrid( 16, 32, player.sprite_sheet:getWidth(), player.sprite_sheet:getHeight() )

    player.animations = {}

    -- walking animations for the player
    player.animations.down = anim8.newAnimation( player.grid('1-4', 1), 0.2 )
    player.animations.up = anim8.newAnimation( player.grid('1-4', 3), 0.2 )
    player.animations.left = anim8.newAnimation( player.grid('1-4', 4), 0.2 )
    player.animations.right = anim8.newAnimation( player.grid('1-4', 2), 0.2 )

    player.anim = player.animations.left
end

function love.update(dt)
    local isMoving = false

    if love.keyboard.isDown("right") then
        isMoving = true
        player.x = player.x + player.speed
        player.anim = player.animations.right
    end
    
    if love.keyboard.isDown("left") then
        isMoving = true
        player.x = player.x - player.speed
        player.anim = player.animations.left
    end

    if love.keyboard.isDown("down") then
        isMoving = true
        player.y = player.y + player.speed
        player.anim = player.animations.down
    end

    if love.keyboard.isDown("up") then
        isMoving = true
        player.y = player.y - player.speed
        player.anim = player.animations.up
    end

    if isMoving == false then
        player.anim:gotoFrame(1)
    end

    player.anim:update(dt)
end

function love.draw()
    player.anim:draw(player.sprite_sheet, player.x, player.y, nil, 10)
end