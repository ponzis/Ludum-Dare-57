shader_type canvas_item;

uniform float brightness: hint_range(-1.0, 1.0, 0.01) = 0.0;
uniform float contrast: hint_range(-10.0, 10.0, 0.01) = 1.0;
uniform float saturation: hint_range(-10.0, 10.0, 0.01) = 1.0;

uniform sampler2D depth_texture: hint_default_black;
uniform sampler2D depth_gradient: hint_default_black;

uniform float depth_cutoff: hint_range(0.0, 1.0, 0.0001) = 1.0;

mat4 brightness_matrix(float b) {
	return mat4(
		vec4(1, 0, 0, 0),
		vec4(0, 1, 0, 0),
		vec4(0, 0, 1, 0),
		vec4(b, b, b, 1)
	);
}

mat4 contrast_matrix(float c) {
	float t = (1.0 - c) / 2.0;
	return mat4(
		vec4(c, 0, 0, 0),
		vec4(0, c, 0, 0),
		vec4(0, 0, c, 0),
		vec4(t, t, t, 1)
	);
}

mat4 saturation_matrix(float s) {
	vec3 luminance = vec3(0.3086, 0.6094, 0.0820);
	float sr = (1.0 - s) * luminance.r;
	float sb = (1.0 - s) * luminance.g;
	float sg = (1.0 - s) * luminance.b;
	
	return mat4(
		vec4(sr + s, sr, sr, 0),
		vec4(sg, sg + s, sg, 0),
		vec4(sb, sb, sb + s, 0),
		vec4(0, 0, 0, 1)
	);
}

void fragment() {
	vec4 color = texture(TEXTURE, UV);

	vec4 depth = texture(depth_texture, UV); 
	
	float greyscale_value = dot(depth.xyz, vec3(0.299, 0.587, 0.114));
	vec4 map = texture(depth_gradient, vec2(greyscale_value, 0.0));
	
	mat4 matrix =
		brightness_matrix(brightness) * 
		contrast_matrix(contrast) * 
		saturation_matrix(saturation);
		
	vec4 newColor = matrix * color * map;
	if(depth.x > depth_cutoff){
		newColor.a = 0.0;
	}else{
		newColor.a = color.a;
	}
	COLOR = newColor;
}
