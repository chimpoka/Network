-- local Class = require("building-blocks/ExtendAndInit")
-- local math = require("building-blocks/library/math")
-- local Vector2 = require("building-blocks/Vector2")

local Class = require("ExtendAndInit")
local math = require("library/math")
local Vector2 = require("Vector2")

local Object = Class()

function Object:init(position, direction, speed, radius, origin)
	self.position = position or Vector2.new(0, 0)
	self.velocity = direction or Vector2.new(1, 1)
	self.velocity = direction.normalize() * speed
	self.speed = speed
	self.radius = radius
	self.origin = origin
end
	
function Object:update(dt)
	self.position = self.position + self.velocity * dt
	self:setBoundingCircle(self.origin, self.radius, dt)
end

function Object:setBoundingCircle(origin, radius, dt)
    local soft = 100
    local direction = origin - self.position
    local distance = direction.length()

    if distance >= radius then
    	self.velocity = math.clampVectorLength(self.velocity + direction.normalize() * soft * dt, self.speed)
    end
end

return Object


