extends Button

@export var game_scene: PackedScene

func _pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)
