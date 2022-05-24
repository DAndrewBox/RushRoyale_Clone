/// @description Draw self
draw_set_alpha(.66);
draw_sprite(sprite_index, 0, x, y);

draw_set_alpha(1);
gpu_set_blendmode(bm_add);
draw_sprite(sprite_index, 1, x, y);
gpu_set_blendmode(bm_normal);