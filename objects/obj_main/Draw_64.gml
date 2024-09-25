if ( layer_sequence_exists("i_sequence", obj_end.sequence) ) return;

if ( layer_sequence_exists("i_sequence", sequence) ) {
	if ( layer_sequence_is_finished(sequence) ) layer_sequence_destroy(sequence);
	
	return;
}

draw_sprite_ext(spr_fruit_gui, 0, 64, 64, 4, 4, 0, -1, 1);

draw_set_font(fnt_score);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_text(128, 64, score);





