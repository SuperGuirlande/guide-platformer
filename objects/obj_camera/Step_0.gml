var _targetX = obj_player.x - view_width / 2;
var _targetY = obj_player.y - view_height / 2;

var _x2 = room_width - view_width;
var _y2 = room_height - view_height;

_targetX = clamp(_targetX, 0, _x2);
_targetY = clamp(_targetY, 0, _y2);

var _xx = camera_get_view_x(camera);
var _yy = camera_get_view_y(camera);

_xx = lerp(_xx, _targetX, my_speed);
_yy = lerp(_yy, _targetY, my_speed);

//----- SCREENSHAKE -----//
if ( shake ) {
	if ( shake_time > 0 ) shake_time --;
	
	addx = choose(- shake_magnitude, shake_magnitude );
	addy = choose(- shake_magnitude, shake_magnitude );
	
	if ( shake_time <= 0 ) {
		shake_magnitude -= shake_fade;
		
		if ( shake_magnitude <= 0 ) {
			shake = false;
			shake_time = 0;
			shake_magnitude = 0;
			shake_fade = 0;
		}
	}
} else {
	addx = 0;
	addy = 0;
}


camera_set_view_pos(camera, _xx + addx, _yy + addy);






