image_xscale = -x_direction;

var _height = sprite_get_height(sprite_index) + 4;


var _detect = scr_detection_square(y - 2 * _height, y + _height, -image_xscale, 320);

draw_text(x, y - _height - 8, _detect);

draw_self();