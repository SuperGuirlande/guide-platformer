/// INPUTS ///
input_left = keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_jump = keyboard_check_pressed(vk_space);
if ( keyboard_check_pressed(ord("R")) )  game_restart();
/// MOVE DIRECTION ///
if ( state != STATES.HIT ) {
	move_direction = input_right - input_left;
}

/// CHECK FLOOR & PLATFORM ///
touch_floor = place_meeting(x, y + 1, obj_collision);
touch_platform = place_meeting(x, y + 1, obj_platform);
if ( touch_platform ) {
	platform_id = instance_place(x, y + 1, obj_platform);
	if ( y - 1 >= platform_id.y ) and ( platform_id.active ) platform_id = -1;
	if ( platform_id != -1 ) {
		if ( !platform_id.active ) touch_platform = false;
	}
}
else platform_id = -1;

/// GOTO FALL ///
if ( state == STATES.IDLE ) or ( state == STATES.RUN ) {
	if ( !touch_floor ) and ( !touch_platform ) {
		state = STATES.FALL;
	}
}

/// GOTO JUMP ///
if ( input_jump ) and ( state != STATES.HIT ) {
	if ( state == STATES.IDLE ) or ( state == STATES.RUN ) or ( state == STATES.WALL ) {
		state = STATES.JUMP;
		move_y = jump_speed;
		input_jump = false;
		scr_emit_jump_particles();
	}
}

/// GOTO DOUBLE JUMP ///
if ( input_jump ) and ( can_double_jump ) {
	state = STATES.DOUBLEJUMP;
	move_y = jump_speed;
	can_double_jump = false;
	scr_emit_jump_particles();
}

/// STATE FALL ///
if ( state == STATES.FALL ) {
	move_y += fall_speed;
	var _col = place_meeting(x, y + move_y, obj_collision);
	if ( _col ) {
		move_y = 0;
		state = STATES.IDLE;
		can_double_jump = true;
		while ( !place_meeting(x, y + 0.1, obj_collision) ) y += 0.1;
		scr_emit_fall_particles();
	}
	
	var _pcol = place_meeting(x, y + move_y, obj_platform);
	var _pid = instance_place(x, y + move_y, obj_platform);
	if ( _pcol ) and ( y - 1 < _pid.y ) and ( _pid.active ) {
		move_y = 0;
		state = STATES.IDLE;
		platform_id = _pid;
		can_double_jump = true;
		while ( !place_meeting(x, y + 0.1, _pid) ) y += 0.1;
		scr_emit_fall_particles();
	}
}

/// MOVE_X ///
if ( state != STATES.HIT ) move_x = move_direction * move_speed;

/// GOTO WALL ///
if ( state == STATES.FALL ) {
	var _col = place_meeting(x + move_x, y, obj_wall);
	if ( _col ) {
		state = STATES.WALL;
		wall_direction = move_direction;
		can_double_jump = true;
	}
}

/// STATE WALL ///
if ( state == STATES.WALL ) {
	move_x = 0;
	move_y = .5;
	//Return idle
	if ( touch_floor ) {
		state = STATES.IDLE;
		while ( !place_meeting(x, y + .1, obj_collision) ) y += .1;
		move_y = 0;
	}
	//Goto fall
	if ( !place_meeting(x + wall_direction, y, obj_wall) ) {
		state = STATES.FALL;
	}
	//Switch direction
	if ( move_direction != wall_direction ) and ( move_direction != 0 ) state = STATES.FALL;
	//Emit wall particles
	scr_emit_wall_particles();
		
}

/// STATE JUMP ///
if ( state == STATES.JUMP ) or ( state == STATES.DOUBLEJUMP ) {
	move_y += fall_speed;
	
	var _col = place_meeting(x, y + move_y, obj_collision);
	if ( _col ) {
		move_y = 0;
		state = STATES.FALL;
	}
	
	if ( move_y >= 0 ) {
		state = STATES.FALL;
	}
}

/// GOTO RUN ///
if ( move_direction != 0 ) {
	if ( state == STATES.IDLE ) {
		state = STATES.RUN;
		image_index = 0;
		alarm[0] = 1;
	}
}

/// RETURN IDLE ///
if ( move_direction == 0 ) {
	if ( state == STATES.RUN ) {
		state = STATES.IDLE;
	}
}



/// CHECK COLLISION ///
var _col = place_meeting(x + move_x, y, obj_collision);
if ( _col ) {
	while ( !place_meeting(x + 0.1 * move_direction, y, obj_collision) ) {
		x += 0.1 * move_direction;
	}
	move_x = 0;
}

/// INCREMENT X and Y ///
x += move_x;
y += move_y;

if ( invincible > 0 ) invincible --;