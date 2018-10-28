local Class = require("building-blocks.ExtendAndInit")
local math = require("building-blocks/library/math")
local Vector2 = require("building-blocks/Vector2")
local Debug = require("building-blocks/Debug")


local Object = Class()

function Object:init(position, speed, radius, origin)
	self.randomOffset = math.rndVec2(-1, 1)

	self.position = position or origin
    self.position = self.position + self.randomOffset * radius
    self.velocity = self.randomOffset.normalize() * speed

	self.speed = speed
	self.radius = radius
	self.origin = origin

    -- self.color = 1
    -- self.isEnabled = false
    -- self.id = 1
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


