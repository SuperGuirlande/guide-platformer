function scr_emit_jump_particles(){
	part_particles_create(part_system, x, y-6, part_type_right, 5);
	part_particles_create(part_system, x, y-6, part_type_left, 5);
}

function scr_emit_fall_particles(){
	part_particles_create(part_system, x, y, part_type_right, 5);
	part_particles_create(part_system, x, y, part_type_left, 5);
}

function scr_emit_wall_particles() {
	var _choice = choose(1,2,3,4);
	if ( _choice == 4 ) {
		if ( wall_direction == 1 ) {
			part_particles_create(part_system, x + 6, y - 12, part_type_left, 1);	
		} else {
			part_particles_create(part_system, x - 6, y - 12, part_type_right, 1);	
		}
	}
}
	