shader_type canvas_item;

uniform sampler2D mask_tex;

void fragment() {
    vec4 theme = texture(TEXTURE, UV);
    vec4 m = texture(mask_tex, UV);
    theme.a *= m.a;      // taglia con alpha della shape
    COLOR = theme;
}
