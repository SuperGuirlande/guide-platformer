function scr_detection_square(top_y, bottom_y, dir, max_distance) {
    var _y1 = top_y;
    var _y2 = bottom_y;
    var _dir = dir;
	var _max_dist = max_distance;
    
    var _dist = 0;
    
    while (!place_meeting(x + _dist * _dir, y, obj_collision) and ( _dist < _max_dist ) ) {
        _dist += 1;
    }
    
	_dist = _dist * _dir;
	
    var _x1 = min(x, x + _dist);
    var _x2 = max(x, x + _dist);
    
    var _xx = obj_player.x;    
    var _yy = obj_player.y;
    
    draw_rectangle(_x1, _y1, _x2, _y2, true);
    
    if (_xx >= _x1 && _xx <= _x2 && _yy >= _y1 && _yy <= _y2) {
        return true;
    }
    
    return false;
}