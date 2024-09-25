// DEPTH //
depth = obj_player.depth + 1;

//------- END ANIMATION -------//
if ( sprite_index == spr_start_moving ) and ( image_index > image_number - 1 ) {
	sprite_index = spr_start_idle;
}
if ( sprite_index == spr_end_pressed ) and ( image_index > image_number - 1 ) {
	sprite_index = spr_end_idle;
}
if ( sprite_index == spr_flag_out ) and ( image_index > image_number - 1 ) {
	sprite_index = spr_flag_idle;
}

// DRAW SELF //
draw_self();










