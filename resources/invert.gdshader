shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

uniform float brightness = 1.0;
uniform float contrast = 1.0;
uniform float saturation = 1.0;

void fragment(){
	vec3 color = textureLod(screen_texture, SCREEN_UV, 0.0).rgb;
	color.rgb = mix(vec3(0.0), color.rgb, brightness);
    color.rgb = mix(vec3(0.5), color.rgb, contrast);
    color.rgb = mix(vec3(dot(vec3(1.0), color.rgb) * 0.33333), color.rgb, saturation);

    COLOR.rgb = color;
}