if ( death_sequence == -1 ) {
	death_sequence = layer_sequence_create("i_sequence", camera_get_view_x(camera), 0, sq_room_exit);
	layer_sequence_play(death_sequence);
}








