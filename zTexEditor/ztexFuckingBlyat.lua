

local ztexFuck = {};
EditorPlayaFuck = {};
ztexFuck[0] = {};

local speedswitch = 1;
local OnTex = 1;
local tex = nil;
local x1 = 100;
local y1 = 100;
local x2 = 50;
local y2 = 50;

for id = 0, MAX_PLAYERS - 1 do
	EditorPlayaFuck[id] = {};
	EditorPlayaFuck[id].ztexOn = false;
	EditorPlayaFuck[id].Timer = 0;
end

function GetTexturesFuck()
	local cout = 0;
	for i,v in ipairs(ztexFuck) do 
		cout = i;
	end
	return cout;
end

function ztexFuck:Create(pid, zetex)
	local cout = GetTexturesFuck();
	if zetex then
		cout = cout + 1
		OnTex = cout
		ztexFuck[cout] = {}
		ztexFuck[cout].arg = CreateTexture(4000, 3500, 4500, 4000, zetex)
		ztexFuck[cout].tex = zetex;
		ztexFuck[cout].x1 = 100;
		ztexFuck[cout].y1 = 100;
		ztexFuck[cout].x2 = 50;
		ztexFuck[cout].y2 = 50;
		ztexFuck:Switch(pid, ztexFuck[cout].x1, ztexFuck[cout].y1, ztexFuck[cout].x2, ztexFuck[cout].y2)
		ShowTexture(pid, ztexFuck[cout].arg);
		SendPlayerMessage(pid,219,20,73,"(ztexFuck): Tex id: "..cout.." has been created.");
	end
end

function ztexFuck:Switch(playerid, x1, y1, x2, y2)
	UpdatePixelTextureCenter(playerid, ztexFuck[OnTex].arg, x1, y1, x2, y2, ztexFuck[OnTex].tex);
end

function ztexFuck:Save(playerid)
	for i = 1, GetTexturesFuck() do
		LogString("(zTexFuck) resultTexEditor", "UpdatePixelTextureCenter(arg "..i..", arg, "..ztex[i].x1..", "..ztex[i].y1..", "..ztex[i].x2..", "..ztex[i].y2..", '"..ztex[i].tex.."')" )
	end
end

function CMD_CTEXFUCK(playerid, params)
	local result, texb = sscanf( params, "s" )
	if result == 1 then
		ztexFuck:Create(playerid, texb)
	end
end
addCommandHandler({"/zfucktex","/зтекс"}, CMD_CTEXFUCK);

function CMD_INITTEXFUCK(playerid, params)
	if EditorPlayaFuck[playerid].ztexOn == false then
		EditorPlayaFuck[playerid].ztexOn = true
		SendPlayerMessage(playerid,219,20,73,"(zTex): zTex has been ON!");
		FreezePlayer(playerid, 1)
	else
		EditorPlayaFuck[playerid].ztexOn = false
		SendPlayerMessage(playerid,219,10,73,"(zTex): zTex has been OFF!");
		FreezePlayer(playerid, 0)
	end
end
addCommandHandler({"/zfuckinit","/зинит"}, CMD_INITTEXFUCK);

function TexSave(playerid)
	ztexFuck:Save(playerid)
end
addCommandHandler({"/ztexsave"}, TexSave);

function im1fuck(playerid)
ztexFuck:Switch(playerid, ztexFuck[OnTex].x1, ztexFuck[OnTex].y1 - speedswitch, ztexFuck[OnTex].x2, ztexFuck[OnTex].y2)
		ztexFuck[OnTex].y1 = ztexFuck[OnTex].y1 - speedswitch
end

function im2fuck(playerid)
		ztexFuck:Switch(playerid, ztexFuck[OnTex].x1, ztexFuck[OnTex].y1 + speedswitch, ztexFuck[OnTex].x2, ztexFuck[OnTex].y2)
		ztexFuck[OnTex].y1 = ztexFuck[OnTex].y1 + speedswitch
end

function im3fuck(playerid)
		ztexFuck:Switch(playerid, ztexFuck[OnTex].x1 - speedswitch, ztexFuck[OnTex].y1, ztexFuck[OnTex].x2, ztexFuck[OnTex].y2)
		ztexFuck[OnTex].x1 = ztexFuck[OnTex].x1 - speedswitch
end

function im4fuck(playerid)
		ztexFuck:Switch(playerid, ztexFuck[OnTex].x1 + speedswitch, ztexFuck[OnTex].y1, ztexFuck[OnTex].x2, ztexFuck[OnTex].y2)
		ztexFuck[OnTex].x1 = ztexFuck[OnTex].x1 + speedswitch
end

function sim1fuck(playerid)
ztexFuck:Switch(playerid, ztexFuck[OnTex].x1, ztexFuck[OnTex].y1 - speedswitch, ztexFuck[OnTex].x2, ztexFuck[OnTex].y2)
		ztexFuck[OnTex].y2 = ztexFuck[OnTex].y2 - speedswitch
end

function sim2fuck(playerid)
		ztexFuck:Switch(playerid, ztexFuck[OnTex].x1, ztexFuck[OnTex].y1 + speedswitch, ztexFuck[OnTex].x2, ztexFuck[OnTex].y2)
		ztexFuck[OnTex].y2 = ztexFuck[OnTex].y2 + speedswitch
end

function sim3fuck(playerid)
		ztexFuck:Switch(playerid, ztexFuck[OnTex].x1 - speedswitch, ztexFuck[OnTex].y1, ztexFuck[OnTex].x2, ztexFuck[OnTex].y2)
		ztexFuck[OnTex].x2 = ztexFuck[OnTex].x2 - speedswitch
end

function sim4fuck(playerid)
		ztexFuck:Switch(playerid, ztexFuck[OnTex].x1 + speedswitch, ztexFuck[OnTex].y1, ztexFuck[OnTex].x2, ztexFuck[OnTex].y2)
		ztexFuck[OnTex].x2 = ztexFuck[OnTex].x2 + speedswitch
end

function zTexUpdateFuck()
	for id = 0, MAX_PLAYERS - 1 do
		if IsPlayerConnected(id) == 1 then
			if EditorPlayaFuck[id].Timer == 1 then
				im1fuck(id)
			elseif EditorPlayaFuck[id].Timer == 2 then
				im2fuck(id)
			elseif EditorPlayaFuck[id].Timer == 3 then
				im3fuck(id)
			elseif EditorPlayaFuck[id].Timer == 4 then
				im4fuck(id)
			elseif EditorPlayaFuck[id].Timer == 5 then
				sim1fuck(id)
			elseif EditorPlayaFuck[id].Timer == 6 then
				sim2fuck(id)
			elseif EditorPlayaFuck[id].Timer == 7 then
				sim3fuck(id)
			elseif EditorPlayaFuck[id].Timer == 8 then
				sim4fuck(id)
			end
		end
	end
end
SetTimer("zTexUpdateFuck", 1, 100);

function TextureEdKeyFuck(playerid, keydown, keyup)
	if EditorPlayaFuck[playerid].ztexOn == true then
		if keydown == KEY_UP then
			EditorPlayaFuck[playerid].Timer = 1 --KillTimer (timerid)
		elseif keydown == KEY_DOWN then
			EditorPlayaFuck[playerid].Timer = 2
		elseif keydown == KEY_LEFT then
			EditorPlayaFuck[playerid].Timer = 3
		elseif keydown == KEY_RIGHT then
			EditorPlayaFuck[playerid].Timer = 4
		elseif keydown == KEY_MINUS then
			speedswitch = speedswitch + 0.1 ;
		elseif keydown == KEY_EQUALS then
			speedswitch = speedswitch - 0.1;
		elseif keydown == KEY_I then
			OnTex = OnTex - 1;
			if OnTex < 1 then
				OnTex = 1
			end
		elseif keydown == KEY_O then
			OnTex = OnTex + 1;
			if OnTex > GetTexturesFuck() then
				OnTex = GetTexturesFuck();
			end
		elseif keyup == KEY_UP then
			EditorPlayaFuck[playerid].Timer = 0
		elseif keyup == KEY_DOWN then
			EditorPlayaFuck[playerid].Timer = 0
		elseif keyup == KEY_LEFT then
			EditorPlayaFuck[playerid].Timer = 0
		elseif keyup == KEY_RIGHT then
			EditorPlayaFuck[playerid].Timer = 0
		
		elseif keydown == KEY_NUMPAD8 then
			EditorPlayaFuck[playerid].Timer = 5 --KillTimer (timerid)
		elseif keydown == KEY_NUMPAD2 then
			EditorPlayaFuck[playerid].Timer = 6
		elseif keydown == KEY_NUMPAD4 then
			EditorPlayaFuck[playerid].Timer = 7
		elseif keydown == KEY_NUMPAD6 then
			EditorPlayaFuck[playerid].Timer = 8
			
		elseif keyup == KEY_NUMPAD8 then
			EditorPlayaFuck[playerid].Timer = 0
		elseif keyup == KEY_NUMPAD2 then
			EditorPlayaFuck[playerid].Timer = 0
		elseif keyup == KEY_NUMPAD4 then
			EditorPlayaFuck[playerid].Timer = 0
		elseif keyup == KEY_NUMPAD6 then
			EditorPlayaFuck[playerid].Timer = 0
		end
	end
end

print(_Module..": "..filename().." has been loaded.");