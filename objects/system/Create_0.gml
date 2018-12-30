#macro CELL_WIDTH 64
#macro CELL_HEIGHT 64
#macro GRID_WIDTH room_width div CELL_WIDTH
#macro GRID_HEIGHT room_height div CELL_HEIGHT

#macro BLOCK 100
#macro ROAD 200

#macro GAME_WIDTH 1280
#macro GAME_HEIGHT 720

randomize();

grid = ds_grid_create(GRID_WIDTH, GRID_HEIGHT);
step = 500;
enemy_numberMax = 10;

enemy_grid = mp_grid_create(0, 0, room_width div CELL_WIDTH + 1, room_height div CELL_WIDTH + 1, CELL_WIDTH, CELL_WIDTH);

scr_map_gen();

cam = camera_create_view(median(0, obj_chr.x - GAME_WIDTH / 2, room_width - GAME_WIDTH)
						,median(0, obj_chr.y - GAME_HEIGHT / 2, room_height - GAME_HEIGHT)
						,GAME_WIDTH, GAME_HEIGHT);
view_camera[0] = cam;

game_score = 1;

draw_set_font(ft_inGame);
draw_set_valign(fa_center);
draw_set_halign(fa_middle);

audio_play_sound(bgm_inGame, 0, true);