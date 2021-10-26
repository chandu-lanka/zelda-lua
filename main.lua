function love.load()
    player = {}
    player.x = 0
    player.y = 0
    player.speed = 3
    player.sprite = love.graphics.newImage('sprites/chick.png')
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed
    end
    
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed
    end

    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
    end

    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
    end
end

function love.draw()
    love.graphics.draw(player.sprite, player.x, player.y)
    love.graphics.draw(player.sprite, player.x + 100, player.y)
end