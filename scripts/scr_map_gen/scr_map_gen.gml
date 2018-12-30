//	초기화
with (OBJ) {
	instance_destroy();
}

//	컨트롤러 생성
controller_x = GRID_WIDTH div 2;
controller_y = GRID_HEIGHT div 2;
controller_dir = 90 * irandom(3);

//	플레이어 생성
instance_create_layer(controller_x * CELL_WIDTH, controller_y * CELL_HEIGHT, "layer_ins", obj_chr);

//	그리드 초기화
ds_grid_set_region(grid, 0, 0, GRID_WIDTH - 1, GRID_HEIGHT - 1, 0);
ds_grid_set_region(grid, controller_x - 2, controller_y - 2, controller_x + 2, controller_y + 2, ROAD);

for (var i = 0; i < step; i++) {
	//	출구 생성
	if (i == step-1) {
		instance_create_layer(controller_x * CELL_WIDTH, controller_y * CELL_HEIGHT, "layer_ins", obj_stair);
	}
	
	//	몬스터 생성
	if (max(i, 1) mod (step / enemy_numberMax) == 0) {
		instance_create_layer(controller_x * CELL_WIDTH, controller_y * CELL_HEIGHT, "layer_ins", obj_enemy_1);
	}
	
	//	길 뚫기
	ds_grid_set(grid, controller_x, controller_y, ROAD);
	if (irandom(4) == 0) {
		controller_dir = controller_dir + 90 * choose(1, -1);
	}
	controller_x += lengthdir_x(1, controller_dir);
	controller_y += lengthdir_y(1, controller_dir);
	
	//	길 뚫기 예외 처리
	controller_x = clamp(controller_x, 1, GRID_WIDTH - 2);
	controller_y = clamp(controller_y, 1, GRID_HEIGHT - 2);
}

//	벽 설정
for (var yy = 1; yy < GRID_HEIGHT - 1; yy++) {
	for (var xx = 1; xx < GRID_WIDTH - 1; xx++) {
		if (grid[# xx, yy] == ROAD) {
			if (grid[# xx+1, yy] != ROAD) grid[# xx+1, yy] = BLOCK;
			if (grid[# xx-1, yy] != ROAD) grid[# xx-1, yy] = BLOCK;
			if (grid[# xx, yy+1] != ROAD) grid[# xx, yy+1] = BLOCK;
			if (grid[# xx, yy-1] != ROAD) grid[# xx, yy-1] = BLOCK;
		}
	}
}

for (var yy = 0; yy < GRID_HEIGHT; yy++) {
	for (var xx = 0; xx < GRID_WIDTH; xx++) {
		if (grid[# xx, yy] == ROAD) {
			//	길 생성
			instance_create_layer(xx * CELL_WIDTH, yy * CELL_HEIGHT, "layer_ins", Road);
		}
		else if (grid[# xx, yy] == BLOCK) {
			//	벽 생성
			instance_create_layer(xx * CELL_WIDTH, yy * CELL_HEIGHT, "layer_ins", Block);
			if (grid[# xx, yy+1] != BLOCK) {
				instance_create_layer(xx * CELL_WIDTH, (yy + 1) * CELL_HEIGHT, "layer_ins", Block_2);
			}
		}
	}
}

//	모션 플레닝
mp_grid_clear_all(enemy_grid);
mp_grid_add_instances(enemy_grid, Block, false);