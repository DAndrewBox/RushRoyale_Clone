/// @description Setup
image_speed = 0;
image_index = 0;
depth = -5;
scale = 2;

HERO = undefined;
TARGET = undefined;
RANK = 1;
CELL = [0, 0];
DECK_POS = -1;

state = "in";
is_drag = false;
grayscale = false;

last_x = xstart;
last_y = ystart;

t_check_enemy = 0;
t_atk_enemy = 0;