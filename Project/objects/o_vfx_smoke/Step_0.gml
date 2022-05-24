/// @description 
image_alpha = 1 - (image_index/(image_number - 1));

if (image_index >= (image_number - 1)) {
	instance_destroy();
}