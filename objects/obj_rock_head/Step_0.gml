/// @description RUN State

if ( state == STATES.RUN ) {
	//Setup speed
	speed = max_speed;
	
	//Setup lengthdir
	var _lx = lengthdir_x(speed, direction);
	var _ly = lengthdir_y(speed, direction);
	
	//Push the player
	if ( place_meeting(x + _lx, y + _ly, obj_player) ) {
		obj_player.x += _lx;
		obj_player.y += _ly;
		if ( place_meeting(x + _lx + (13 * sign(_lx)), y + _ly + (20 * sign(_ly)), obj_collision) ) {
			with(obj_player) {
				state = STATES.HIT;
				image_index = 0;
				can_double_jump = false;
			}
		}

	}

	//Stop collision
	if ( place_meeting(x + _lx, y + _ly, obj_collision) ) {
		speed = 0;
		state = STATES.IDLE;
		alarm[0] = room_speed;
		image_index = 0;
		
		switch ( direction ) {
			case 0 : sprite_index = spr_rockhead_right_hit; var _xx = 0.1; var _yy = 0; break;
			case 90 : sprite_index = spr_rockhead_top_hit; var _xx = 0; var _yy = -0.1; break;
			case 180 : sprite_index = spr_rockhead_left_hit; var _xx = -0.1; var _yy = 0; break;
			case 270 : sprite_index = spr_rockhead_bottom_hit; var _xx = 0; var _yy = 0.1; break;
		}
		
		while ( !place_meeting(x + _xx, y + _yy, obj_collision) ) {
			x += _xx;
			y += _yy;
		}
		
		//Player HIT
		if ( place_meeting(x + _lx, y + _ly, obj_player) ) {
			with ( obj_player ) {
				state = STATES.HIT;
				image_index = 0;
				can_double_jump = false;
			}
		}
		
		//Screenshake
		if ( distance_to_object(obj_player) <= 200 ) obj_camera.screenshake(15, 1.5, .3);
	}
}










