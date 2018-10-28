local Object = require("Object")
-- local Vector2 = require("building-blocks/Vector2")
local Vector2 = require("Vector2")

GameLogic = {}

function GameLogic:init()
	count = 5
	objects = {}
	radius = 100
	origin = Vector2.new(400, 300)

	for i=1, count do
		objects[i] = Object(Vector2.new(200+i*20,200+i*20), Vector2.new(-2, 1), 100, radius, origin)
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


