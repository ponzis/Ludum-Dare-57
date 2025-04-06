shader_type canvas_item;

uniform float brightness: hint_range(-10.0, 10.0, 0.0001) = 1.0;

uniform sampler2D depth_texture: hint_default_black;
uniform float depth_factor: hint_range(-10.0, 10.0, 0.0001) = 1.0;
uniform float depth_cutoff: hint_range(-10.0, 10.0, 0.0001) = 1.0;
uniform float depth_brightness: hint_range(-10.0, 10.0, 0.0001) = 1.0;

mat4 brightness_matrix(float b) {
	return mat4(
		vec4(1, 0, 0, 0),
		vec4(0, 1, 0, 0),
		vec4(0, 0, 1, 0),
		vec4(b, b, b, 1)
	);
}

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	vec4 depth = (texture(depth_texture, UV)) * depth_factor; 
	vec4 newColor = brightness_matrix(brightness) * color;
	newColor *= 1.0 - (depth * depth_brightness);
	
	if(depth.x > depth_cutoff){
		newColor.a = 0.0;
	}else{
		newColor.a = color.a;
	}
	COLOR = newColor;
}
