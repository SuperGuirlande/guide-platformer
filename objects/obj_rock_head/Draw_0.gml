//----- END HIT ANIMATION -----//
if ( sprite_index != spr_rockhead_blink ) and ( sprite_index != spr_rockhead_idle ) {
	if ( image_index > image_number - 1 ) {
		alarm[1] = room_speed / 2;
		sprite_index = spr_rockhead_idle;
	}
}

//----- END BLINK ANIMATION -----//
if ( sprite_index == spr_rockhead_blink ) {
	if ( image_index > image_number - 1 ) {
		alarm[0] = room_speed;
		sprite_index = spr_rockhead_idle;
	}
}

draw_self();