/// STATES ///
enum STATES { IDLE, RUN, FALL, JUMP, DOUBLEJUMP, WALL, HIT }

///CHECKPOINTS
globalvar last_checkpoint, death_sequence, enter_sequence, sequence_frame;
last_checkpoint = -1;
death_sequence = -1;
enter_sequence = -1;
sequence_frame = 0;

///CAMERA///
if ( !instance_exists(obj_camera) ) {
	var _cam = instance_create_layer(0, 0, "Instances", obj_camera);
}

/// SEQUENCE ///
sequence = -1;
if ( !layer_sequence_exists("i_sequence", sequence) ) {
	var _xx = camera_get_view_x(view_camera[0]);
	var _yy = camera_get_view_y(view_camera[0]);

	sequence = layer_sequence_create("i_sequence", _xx, _yy, sq_room_enter);
	layer_sequence_play(sequence);
}

/// PARTICLES ///
globalvar part_system, part_type_right, part_type_left, part_type_checkpoint;
part_system = part_system_create();


part_type_right = part_type_create();
part_type_direction(part_type_right, 160, 200, 0, 0);
part_type_speed(part_type_right, 1, 2, -0.1, 0);
part_type_sprite(part_type_right, spr_dust_particle, 0, 0, 0);
part_type_life(part_type_right, 15, 25);
part_type_alpha3(part_type_right, 1, 1, 0);
part_type_size(part_type_right, .35, .5, 0, 0);

part_type_left = part_type_create();
part_type_direction(part_type_left, -20, 20, 0, 0);
part_type_speed(part_type_left, 1, 2, -0.1, 0);
part_type_sprite(part_type_left, spr_dust_particle, 0, 0, 0);
part_type_life(part_type_left, 15, 25);
part_type_alpha3(part_type_left, 1, 1, 0);
part_type_size(part_type_left, .35, .5, 0, 0);


part_type_checkpoint = part_type_create();
part_type_alpha3(part_type_checkpoint, 1, 1, 0);
part_type_direction(part_type_checkpoint, 90, 90, 0, 0);
part_type_life(part_type_checkpoint, room_speed / 2, room_speed);
part_type_sprite(part_type_checkpoint, spr_particle_confetti, 0, 0, 1);
part_type_speed(part_type_checkpoint, 0.5, 1, 0, 0);
part_type_gravity(part_type_checkpoint, 0.05, 270);
part_type_size(part_type_checkpoint, 0.15, 0.15, 0, 0);