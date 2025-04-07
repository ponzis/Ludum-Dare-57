shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture, filter_linear_mipmap;

uniform float power_factor: hint_range(0.0, 10.0, 0.01) = 0.5;
//uniform sampler2D noise;
//uniform float noise_factor: hint_range(0.0, 10.0, 0.01) = 0.5;

uniform float alpha_cutoff: hint_range(0.0, 1.0, 0.0001) = 1.0;
uniform vec3 tint: source_color = vec3(0.1, 0.1, 0.0);


uniform sampler2D falloff: hint_default_black;

void fragment() {
	vec4 color = texture(screen_texture, SCREEN_UV);
	//float noise_texture = dot(texture(noise, SCREEN_UV).rgb, vec3(noise_factor)) / 3.0;

	vec4 mask = texture(TEXTURE, UV);
	vec4 falloff_mask = texture(falloff, UV);

	//color.a = ((mask.a - power_modifier) * power_factor) * noise_texture * depth_texture;
	color.a = (mask.a * dot(mask.rgb, vec3(0.299, 0.587, 0.114)) * falloff_mask.a * power_factor);
	color.rgb = color.rgb + mask.rgb * tint;
	COLOR = color;
}