shader_type spatial;

void vertex() {
	// Called for every vertex the material is visible on.
}
instance uniform float scale: hint_range(0,100) = 1.0;
instance uniform float x_shift: hint_range(0.0, 1.0) = 0.0;
instance uniform float y_shift: hint_range(0.0, 1.0) = 0.0;

void fragment() {
	float center = length(vec2((UV.x*scale-x_shift*scale), UV.y*scale-y_shift*scale));
	float small = center - floor(center);
	float large = 1.0 - small;
	float nearest = min(large, small);
	float value = 1.0 - (nearest * 4.0);
	
	ALBEDO = vec3(value, value, value);
	
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
