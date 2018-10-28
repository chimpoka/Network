local Vector2 = require("building-blocks/Vector2")
local Object = require("Object")


GameLogic = {}

function GameLogic:init()
	objects = {}
	windowSize = Vector2.new(0, 0)
	windowSize.x, windowSize.y = love.window.getMode()

	count = 1000
	radius = 300
	speed = 100
	origin = Vector2.new(windowSize.x / 2, windowSize.y / 2)
	position = origin + Vector2.new(0,0)

	for i=1, count do
		objects[i] = Object(position, speed, radius, origin)
	end
end
	
function GameLogic:update(dt)
	for i=1, count do
		objects[i]:update(dt)
	end
end

function GameLogic:draw()
	-- objects
	love.graphics.setColor(0, 1, 0)
	for i=1, count do
		love.graphics.circle("fill", objects[i].position.x, objects[i].position.y, 4)
	end 

	-- radius
	love.graphics.setColor(1, 1, 0)
	love.graphics.circle("line", origin.x, origin.y, radius)
end

return GameLogic


