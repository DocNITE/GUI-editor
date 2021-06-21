

local zdrawFuck = {};
EditorPlayaDrawFuck = {};
zdrawFuck[0] = {};

local speedswitch = 1;
local OnDraw = 1;
local tex = nil;
local x1 = 100;
local y1 = 100;
local x2 = 50;
local y2 = 50;

for id = 0, MAX_PLAYERS - 1 do
	EditorPlayaDrawFuck[id] = {};
	EditorPlayaDrawFuck[id].ztexOn = false;
	EditorPlayaDrawFuck[id].Timer = 0;
end

function GetDrawFucks()
	local cout = 0;
	for i,v in ipairs(zdrawFuck) do 
		cout = i;
	end
	return cout;
end

function zdrawFuck:Create(pid, zetex)
	local cout = GetDrawFucks();
	if zetex then
		cout = cout + 1
		OnDraw = cout
		zdrawFuck[cout] = {}
		zdrawFuck[cout].arg = CreateDraw(6035, 1690, zetex, "Font_Old_10_White_Hi.TGA", 255,255,255); --CreateDraw(3015, 5035)
		zdrawFuck[cout].tex = zetex;
		zdrawFuck[cout].x1 = 100;
		zdrawFuck[cout].y1 = 100;
		zdrawFuck:Switch(pid, zdrawFuck[cout].x1, zdrawFuck[cout].y1, zdrawFuck[cout].x2, zdrawFuck[cout].y2)
		ShowDraw(pid, zdrawFuck[cout].arg);
		SendPlayerMessage(pid,0,130,180,"(zdrawFuck): Tex id: "..cout.." has been created.");
	end
end

function zdrawFuck:Switch(playerid, x1, y1, x2, y2)
	UpdatePixelDrawCenter(playerid, zdrawFuck[OnDraw].arg, x1, y1)
end

function zdrawFuck:Save(playerid)
	for i = 1, GetDrawFucks() do
		LogString("(zDrawFuck) resultTexEditor", "UpdatePixelDrawCenter(arg "..i..", arg, "..zdrawFuck[i].x1..", "..zdrawFuck[i].y1..", "..zdrawFuck[i].tex.."')" )
	end
end

function CMD_CDRAWFUCK(playerid, params)
	local result, texb = sscanf( params, "s" )
	if result == 1 then
		zdrawFuck:Create(playerid, texb)
	end
end
addCommandHandler({"/zfuckdraw","/зтекс"}, CMD_CDRAWFUCK);

function CMD_INITDRAWFUCK(playerid, params)
	if EditorPlayaDrawFuck[playerid].ztexOn == false then
		EditorPlayaDrawFuck[playerid].ztexOn = true
		SendPlayerMessage(playerid,0,130,180,"(zTex): zTex has been ON!");
		FreezePlayer(playerid, 1)
	else
		EditorPlayaDrawFuck[playerid].ztexOn = false
		SendPlayerMessage(playerid,0,130,180,"(zTex): zTex has been OFF!");
		FreezePlayer(playerid, 0)
	end
end
addCommandHandler({"/zdrawinit","/зинит"}, CMD_INITDRAWFUCK);

function TexSave(playerid)
	zdrawFuck:Save(playerid)
end
addCommandHandler({"/zdrawsave"}, TexSave);

function yim1fuck(playerid)
zdrawFuck:Switch(playerid, zdrawFuck[OnDraw].x1, zdrawFuck[OnDraw].y1 - speedswitch, zdrawFuck[OnDraw].x2, zdrawFuck[OnDraw].y2)
		zdrawFuck[OnDraw].y1 = zdrawFuck[OnDraw].y1 - speedswitch
end

function yim2fuck(playerid)
		zdrawFuck:Switch(playerid, zdrawFuck[OnDraw].x1, zdrawFuck[OnDraw].y1 + speedswitch, zdrawFuck[OnDraw].x2, zdrawFuck[OnDraw].y2)
		zdrawFuck[OnDraw].y1 = zdrawFuck[OnDraw].y1 + speedswitch
end

function yim3fuck(playerid)
		zdrawFuck:Switch(playerid, zdrawFuck[OnDraw].x1 - speedswitch, zdrawFuck[OnDraw].y1, zdrawFuck[OnDraw].x2, zdrawFuck[OnDraw].y2)
		zdrawFuck[OnDraw].x1 = zdrawFuck[OnDraw].x1 - speedswitch
end

function yim4fuck(playerid)
		zdrawFuck:Switch(playerid, zdrawFuck[OnDraw].x1 + speedswitch, zdrawFuck[OnDraw].y1, zdrawFuck[OnDraw].x2, zdrawFuck[OnDraw].y2)
		zdrawFuck[OnDraw].x1 = zdrawFuck[OnDraw].x1 + speedswitch
end

function zDrawUpdateFuck()
	for id = 0, MAX_PLAYERS - 1 do
		if IsPlayerConnected(id) == 1 then
			if EditorPlayaDrawFuck[id].Timer == 1 then
				yim1fuck(id)
			elseif EditorPlayaDrawFuck[id].Timer == 2 then
				yim2fuck(id)
			elseif EditorPlayaDrawFuck[id].Timer == 3 then
				yim3fuck(id)
			elseif EditorPlayaDrawFuck[id].Timer == 4 then
				yim4fuck(id)
			end
		end
	end
end
SetTimer("zDrawUpdateFuck", 1, 100);

function DrawsEdKeyFuck(playerid, keydown, keyup)
	if EditorPlayaDrawFuck[playerid].ztexOn == true then
		if keydown == KEY_UP then
			EditorPlayaDrawFuck[playerid].Timer = 1 --KillTimer (timerid)
		elseif keydown == KEY_DOWN then
			EditorPlayaDrawFuck[playerid].Timer = 2
		elseif keydown == KEY_LEFT then
			EditorPlayaDrawFuck[playerid].Timer = 3
		elseif keydown == KEY_RIGHT then
			EditorPlayaDrawFuck[playerid].Timer = 4
		elseif keydown == KEY_MINUS then
			speedswitch = speedswitch + 0.1 ;
		elseif keydown == KEY_EQUALS then
			speedswitch = speedswitch - 0.1;
		elseif keydown == KEY_I then
			OnDraw = OnDraw - 1;
			if OnDraw < 1 then
				OnDraw = 1
			end
		elseif keydown == KEY_O then
			OnDraw = OnDraw + 1;
			if OnDraw > GetDrawFucks() then
				OnDraw = GetDrawFucks();
			end
		elseif keyup == KEY_UP then
			EditorPlayaDrawFuck[playerid].Timer = 0
		elseif keyup == KEY_DOWN then
			EditorPlayaDrawFuck[playerid].Timer = 0
		elseif keyup == KEY_LEFT then
			EditorPlayaDrawFuck[playerid].Timer = 0
		elseif keyup == KEY_RIGHT then
			EditorPlayaDrawFuck[playerid].Timer = 0
		end
	end
end

print(_Module..": "..filename().." has been loaded.");