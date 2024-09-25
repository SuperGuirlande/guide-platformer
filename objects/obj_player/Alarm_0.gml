if ( state == STATES.RUN ) {
	if ( move_direction == 1 ) {
		part_particles_create(part_system, x, y, part_type_right, 5);
	} else {
		part_particles_create(part_system, x, y, part_type_left, 5);
	}
	
	alarm[0] = room_speed / 2;
}