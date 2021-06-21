
require "zTexEditor/ztex"
require "zTexEditor/ztexFuckingBlyat"
require "zTexEditor/zdrawFuckingBlyat"
require "zTexEditor/zdraw"
require "zTexEditor/help"

function zTexKey(playerid, keyDown, keyUp)
	TextureEdKey(playerid, keyDown, keyUp);
	TextureEdKeyFuck(playerid, keyDown, keyUp)
	zDrawKey(playerid, keyDown, keyUp);
	DrawsEdKeyFuck(playerid, keyDown, keyUp)
	zHelpKey(playerid, keyDown, keyUp)
end

print("-== zTex Editor v0.2 has benn loaded ==-")