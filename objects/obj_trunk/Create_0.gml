event_inherited();

/// VARS
x_direction = choose(-1, 1);
state = STATES.IDLE;

/// Change direction
change_dir_delay = room_speed * 2;
alarm[0] = irandom(change_dir_delay);