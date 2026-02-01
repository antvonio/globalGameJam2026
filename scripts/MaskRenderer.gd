extends TextureRect

@onready var mask_manager: MaskManager = get_parent().get_node("MaskManager")

@onready var maskPanel = self
@onready var shape: TextureRect = maskPanel.get_node("Shape")
@onready var maskTheme: TextureRect = maskPanel.get_node("Theme")
@onready var eyes: TextureRect = maskPanel.get_node("Eyes")
@onready var top: TextureRect = maskPanel.get_node("Top")


func _ready() -> void:
	mask_manager.mask.mask_changed.connect(_on_mask_changed)

func _apply_mask_to_theme() -> void:
	var mat := maskTheme.material as ShaderMaterial
	if mat == null:
		push_error("Theme non ha ShaderMaterial!")
		return
	if shape.texture == null:
		return
	mat.set_shader_parameter("mask_tex", shape.texture)
	
func _on_mask_changed(attribute: String, tex: Texture2D) -> void:
	print("mask_changed")
	match attribute:
		"shapes":
			shape.texture = tex
			_apply_mask_to_theme()
		"themes":
			maskTheme.texture = tex
			_apply_mask_to_theme()
		"eyes":
			eyes.texture = tex
		"tops":
			top.texture = tex
