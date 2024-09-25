/// @description Switch direction and goto RUN

my_direction ++;

var _nb_dir = array_length(directions);
if ( my_direction > _nb_dir - 1 ) my_direction = 0;

direction = directions[my_direction];

state = STATES.RUN;














