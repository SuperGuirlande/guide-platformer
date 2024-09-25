/// SETUP SPRITES ///
switch ( state ) {
	case STATES.IDLE : sprite_index = spr_mask_idle; break;	
	case STATES.RUN : sprite_index = spr_mask_run; break;	
	case STATES.FALL : sprite_index = spr_mask_fall; break;	
	case STATES.JUMP : sprite_index = spr_mask_jump; break;	
	case STATES.DOUBLEJUMP : sprite_index = spr_mask_double_jump; break;	
	case STATES.WALL : sprite_index = spr_mask_wall_jump; break;	
	case STATES.HIT : sprite_index = spr_mask_hit; break;	
}

/// HORIZONTAL DIRECTION ///
if ( state != STATES.HIT ) {
	if ( move_direction != 0 ) and ( state != STATES.WALL ) {
		image_xscale = move_direction;
	}
	if ( state == STATES.WALL ) {
		image_xscale = wall_direction;
	}
}

/// STATE HIT ///
if ( state == STATES.HIT ) {
	if ( !animation_ended ) {
		if ( image_index >= image_number - 1 ) {
			animation_ended = true;
			
			alarm[1] = room_speed / 2;
		}
	} else {
		image_speed = 0;
		image_alpha -= 0.05;
	}
	
	move_x = .5 * move_direction;
	
	image_angle += 0.5 * -move_direction;
}

draw_self();






