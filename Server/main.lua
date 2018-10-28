package.path = "E:/Projects/Lua/Network/?.lua;"..package.path
local Debug = require("building-blocks/Debug")
local GameLogic = require("GameLogic")


function love.load()
	love.window.setMode(1200, 900)
	GameLogic.init()
end

function love.update(dt)
	GameLogic:update(dt)
end

function love.draw()
	GameLogic.draw()
end

function love.quit()
	Debug.pause()
end
