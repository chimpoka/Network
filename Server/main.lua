local GameLogic = require("GameLogic")


function love.load()
	GameLogic.init()
end

function love.update(dt)
	GameLogic.update(dt)
end

function love.draw()
	GameLogic.draw()
end

function love.quit()
	os.execute("pause")
end
