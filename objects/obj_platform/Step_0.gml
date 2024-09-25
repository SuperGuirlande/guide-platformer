//-----STATE RUN
if ( state == STATES.RUN ) {
	var _col = place_meeting(x, y + move_speed * vertical_direction, obj_platform_collision);
	if ( _col ) {
		state = STATES.IDLE;
		alarm[0] = room_speed * 3;
		return;
	}
	
	y += move_speed * vertical_direction;
	if ( obj_player.platform_id == id ) obj_player.y += move_speed * vertical_direction;
}

//-----DESACTIVATE PLATFORM
if ( obj_player.platform_id == id ) and ( keyboard_check_pressed(vk_down) ) and ( active ) {
	active = false;
	obj_player.y ++;
	obj_player.state = STATES.FALL;
}

//-----REACTIVATE PLATFORM
if ( !active ) and ( !place_meeting(x, y, obj_player) ) active = true;
