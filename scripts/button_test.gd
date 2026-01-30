extends Button

@export var new_texture: String
@onready var mask_base: Sprite2D = 	get_parent().get_parent().get_parent().get_node("MaskBase")

func _on_pressed() -> void:
	mask_base.texture = load(new_texture)
