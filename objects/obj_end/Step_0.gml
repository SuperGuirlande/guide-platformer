event_inherited();
	
//------- ROOM GOTO NEXT ------//
if ( layer_sequence_exists("i_sequence", sequence) ) {
	if ( layer_sequence_is_finished(sequence) ) {
		layer_sequence_destroy(sequence);
		room_goto_next();
	}
}









