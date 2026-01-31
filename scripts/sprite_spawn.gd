extends Node2D

@export var sprite_scene: PackedScene
@export var spawn_interval: float = 0.3

var timer:= 0.0

func _process(delta):
	timer -= delta
	if timer < 0.0 or timer == 0.0:
		spawn_sprite()
		timer = spawn_interval

func spawn_sprite():
	var sprite = sprite_scene.instantiate()
	var rect = get_viewport().get_visible_rect()
	sprite.position = Vector2(
		randf_range(0, rect.size.x), -200
	)
	add_child(sprite)
