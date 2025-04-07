shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture, repeat_disable, filter_linear_mipmap;

uniform float pixle_size: hint_range(0.0, 250.0, 1.0) = 40.0;

void fragment() {
	float aspectRatio = SCREEN_PIXEL_SIZE.y / SCREEN_PIXEL_SIZE.x;
	vec2 uv = SCREEN_UV;
	uv.x *= aspectRatio;
	uv = vec2(
        float(int(uv.x * pixle_size)) / pixle_size,
        float(int(uv.y * pixle_size)) / pixle_size
    );
	uv.x /= aspectRatio;
	
	vec4 color = texture(screen_texture, uv);
	
	COLOR = color;
}
