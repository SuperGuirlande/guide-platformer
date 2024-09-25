if ( !layer_sequence_exists("i_sequence", sequence) ) {
	var _xx = camera_get_view_x(view_camera[0]);
	var _yy = camera_get_view_y(view_camera[0]);
	
	sequence = layer_sequence_create("i_sequence", _xx, _yy, sq_room_exit);
	layer_sequence_play(sequence);
}











