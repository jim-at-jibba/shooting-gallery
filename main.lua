-- three main functions: load, update, draw

-- load is called once at the beginning of the game
-- set game state, load assets, etc
function love.load()
	target = {}
	target.x = 300
	target.y = 300
	target.radius = 50

	score = 0
	timer = 10

	-- set custom font
	gameFont = love.graphics.newFont(40)
end

-- update is called every frame
-- 60 frames a second
-- dt will adjust for different frame rates
function love.update(dt)
	if timer > 0 then
		timer = timer - dt
	end

	if timer < 0 then
		timer = 0
	end
end

-- draw graphsics to the screen
-- called every frame
-- no calculations or logic
function love.draw()
	-- draw a rectangle fill, x, y, width, height
	-- love.graphics.rectangle("fill", 100, 100, 50, 50)

	-- to use RGB colors with 255 scale /255
	-- love.graphics.setColor(0/255, 0/255, 255/255)
	-- love.graphics.setColor(0, 0, 1)
	-- love.graphics.circle("fill", 100, 100, 50)

	love.graphics.setColor(1, 0, 0)
	love.graphics.circle("fill", target.x, target.y, target.radius)

	love.graphics.setColor(1, 1, 1)
	love.graphics.setFont(gameFont)
	love.graphics.print(score, 0, 0)
	love.graphics.print(math.ceil(timer), 300, 0)
end

-- mousepressed is a function that is called
-- every time a mouse button is pressed
-- x and y are the coordinates of the mouse
-- button is the button on the mouse that was pressed
function love.mousepressed(x, y, button, istouch, presses)
	if button == 1 then
		local mouseToTarget = distanceBetween(x, y, target.x, target.y)
		if mouseToTarget < target.radius then
			score = score + 1
			target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
			target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
		end
	end
end

-- distance between two points
-- x1, y1 are the coordinates of the first point
-- x2, y2 are the coordinates of the second point
function distanceBetween(x1, y1, x2, y2)
	return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end
