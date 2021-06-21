for id = 0, MAX_PLAYERS - 1 do
	EditorPlaya[id].zhelpOn = 0;
end

function zTex_cmd_help(playerid)
 
    EditorPlaya[playerid].zhelpOn = 1;
    ShowDraw(playerid, help_name);
    ShowDraw(playerid, help_string1);
    ShowDraw(playerid, help_string2);
    ShowDraw(playerid, help_string3);
    ShowDraw(playerid, help_string4);
    ShowDraw(playerid, help_string5);
    ShowDraw(playerid, help_string6);
    ShowDraw(playerid, help_string7);
    ShowDraw(playerid, help_string8);
    ShowDraw(playerid, help_version);
    ShowDraw(playerid, help_author);
    ShowDraw(playerid, help_exit);
    ShowTexture(playerid, help_background);
    ShowTexture(playerid, help_line);
    
end
addCommandHandler({"/zhelp"}, zTex_cmd_help);

--==================================================================================================
help_background = CreateTexture(2428, 2757, 6043, 5856, "menu_ingame");
help_line = CreateTexture(2570, 4520, 5872, 4640, "blabla");
help_name = CreateDraw(3915, 2940,"HOW TO USE", "Font_Old_10_White_Hi.TGA", 240,219,62);
help_string1 = CreateDraw(2568, 3222,"Command to activated scripts = /dinit (draw) and /zinit (texture)", "Font_Old_10_White_Hi.TGA", 242,235,177);
help_string2 = CreateDraw(2568, 3422,"Create new draw = /zdraw (draw_name) # example = /zdraw Hello World!", "Font_Old_10_White_Hi.TGA", 197,201,199);
help_string3 = CreateDraw(2568, 3622,"Create new texture = /ztex (tex_name) # example = /ztex menu_ingame", "Font_Old_10_White_Hi.TGA", 197,201,199);
help_string4 = CreateDraw(2568, 3822,"Setup movement speed = press - or +", "Font_Old_10_White_Hi.TGA", 197,201,199);
help_string5 = CreateDraw(2568, 4022,"Switch between draws or textures = press O or I", "Font_Old_10_White_Hi.TGA", 197,201,199);
help_string6 = CreateDraw(2568, 4222,"To save = /drawsave or /texsave", "Font_Old_10_White_Hi.TGA", 197,201,199);
help_string7 = CreateDraw(2568, 4722,"Use arrows on your keyboard to moving draw or texture", "Font_Old_10_White_Hi.TGA", 197,201,199);
help_string8 = CreateDraw(2568, 4872,"For change size use arrows on your NUMPAD", "Font_Old_10_White_Hi.TGA", 197,201,199);
help_version = CreateDraw(5695, 5415,"v0.2", "Font_Old_10_White_Hi.TGA", 197,201,199);
help_author = CreateDraw(5180, 5560,"Author: DocNight", "Font_Old_10_White_Hi.TGA", 197,201,199);
help_exit = CreateDraw(2568, 5565,"L.CTRL", "Font_Old_10_White_Hi.TGA", 255,105,105);
--********************************************************************************************************************

function zHelpKey(playerid, keyDown, keyUp)
	if keyDown == KEY_LCONTROL then
		if EditorPlaya[playerid].zhelpOn == 1 then
		EditorPlaya[playerid].zhelpOn = 0;
		HideDraw(playerid, help_name);
		HideDraw(playerid, help_string1);
	   HideDraw(playerid, help_string2);
		HideDraw(playerid, help_string3);
		HideDraw(playerid, help_string4);
		HideDraw(playerid, help_string5);
		HideDraw(playerid, help_string6);
		HideDraw(playerid, help_string7);
		HideDraw(playerid, help_string8);
		HideDraw(playerid, help_version);
		 HideDraw(playerid, help_author);
		 HideDraw(playerid, help_exit);
		 HideTexture(playerid, help_background);
		HideTexture(playerid, help_line);
		end
	end
end