shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture, filter_linear_mipmap;

uniform sampler2D depth: hint_default_black;
uniform float depth_factor: hint_range(0.0, 10.0, 0.01) = 0.5;

uniform vec3 tint: source_color = vec3(0.1, 0.1, 0.0);

void fragment() {
	vec4 color = texture(screen_texture, SCREEN_UV);
	float depth_texture = dot(texture(depth, SCREEN_UV).rgb, vec3(depth_factor));
	
	color.a = texture(TEXTURE, UV).a * depth_texture;
	color.rgb += tint;
	COLOR = color;
}
