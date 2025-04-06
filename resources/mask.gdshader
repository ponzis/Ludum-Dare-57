shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture, filter_linear_mipmap;


uniform float power_factor: hint_range(0.0, 10.0, 0.01) = 0.5;
uniform float power_modifier: hint_range(-10.0, 10.0, 0.01) = 0.0;

uniform sampler2D noise;
uniform float noise_factor: hint_range(0.0, 10.0, 0.01) = 0.5;

uniform sampler2D depth: hint_default_black;
uniform float depth_factor: hint_range(0.0, 10.0, 0.01) = 0.5;

uniform vec3 tint: source_color = vec3(0.1, 0.1, 0.0);

void fragment() {
	vec4 color = texture(screen_texture, SCREEN_UV);
	vec4 mask = texture(TEXTURE, UV);
		
	float depth_texture = dot(texture(depth, SCREEN_UV).rgb, vec3(depth_factor)) / 3.0;
	//float noise_texture = dot(texture(noise, SCREEN_UV).rgb, vec3(noise_factor)) / 3.0;
	
	//color.a = ((mask.a - power_modifier) * power_factor) * noise_texture * depth_texture;
	color.a = ((mask.a - power_modifier) * power_factor) * depth_texture;
	color.rgb += mask.rgb + tint;
	COLOR = color;
}
