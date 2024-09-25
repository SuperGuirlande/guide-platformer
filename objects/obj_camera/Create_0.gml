globalvar camera, view_width, view_height;
camera = view_camera[0];

view_width = 640;
view_height = 360;
camera_set_view_size(camera, view_width, view_height);

my_speed = .03;


shake_time = 0;
shake_magnitude = 0;
shake_fade = 0;
shake = false;

function screenshake ( _time, _magnitude, _fade ) {
	with ( obj_camera ) {
		shake = true;
		shake_time = _time;
		shake_magnitude = _magnitude;
		shake_fade = _fade;
	}
}






