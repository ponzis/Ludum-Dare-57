shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture, filter_linear_mipmap;

uniform vec3 tint: source_color = vec3(0.1, 0.1, 0.0);

void fragment() {
	vec4 color = texture(screen_texture, SCREEN_UV);
	color.a = texture(TEXTURE, UV).a;
	color.rgb += tint;
	COLOR = color;
}
