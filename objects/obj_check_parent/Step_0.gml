//------- PLAYER COLLISION --------//
if ( place_meeting(x, y, obj_player) ) and ( !actived ) {
	actived = true;
	last_checkpoint = id;
	
	switch ( object_index ) {
		case obj_start : sprite_index = spr_start_moving; break;
		case obj_flag : sprite_index = spr_flag_out; break;
		case obj_end : sprite_index = spr_end_pressed; break;
	}
	image_index = 0;
	
	randomize();
	repeat(100) {
		var _xx = irandom_range(x - 32, x + 32);
		var _yy = irandom_range(y - 64, y);
		part_particles_create(part_system, _xx, _yy, part_type_checkpoint, 1);
	}
	
	if ( object_index == obj_end ) alarm[0] = room_speed;
}







