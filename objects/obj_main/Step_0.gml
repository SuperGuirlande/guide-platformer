///----- DEATH SEQUENCES ------///
if ( layer_sequence_exists("i_sequence", death_sequence) ) {
	sequence_frame ++;
	
	layer_sequence_x(death_sequence, camera_get_view_x(camera));
	layer_sequence_y(death_sequence, camera_get_view_y(camera));

	if ( layer_sequence_is_finished(death_sequence) ) {
		layer_sequence_destroy(death_sequence);
		death_sequence = -1;
		sequence_frame = 0;
		
		var _deadPlayer = instance_find(obj_player, 0);
		var _newPlayer = instance_create_layer(last_checkpoint.x, last_checkpoint.y, "Instances", obj_player);
		instance_destroy(_deadPlayer);
	}
	
	if ( sequence_frame == 58 ) {
		enter_sequence = layer_sequence_create("i_sequence", camera_get_view_x(camera), 0, sq_room_enter);
		layer_sequence_play(enter_sequence);
	}
}

if ( layer_sequence_exists("i_sequence", enter_sequence) ) {
	layer_sequence_x(enter_sequence, camera_get_view_x(camera));
	layer_sequence_y(enter_sequence, camera_get_view_y(camera));
	
	if ( layer_sequence_is_finished(enter_sequence) ) layer_sequence_destroy(enter_sequence);
}