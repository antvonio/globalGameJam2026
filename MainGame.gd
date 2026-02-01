extends Control

@export var game_timer: int
@export var menu_scene: PackedScene
@onready var bar := $Bar

@onready var main := get_tree().current_scene
@onready var ui := main.get_node("UI") as CanvasItem
@onready var customer_root := main.get_node("Customer") as CanvasItem
@onready var end_screen := main.get_node("End") as CanvasItem

@onready var silhouette = end_screen.get_node("Silhouette")
@onready var chadinella = end_screen.get_node("Chadinella")
@onready var scorefinal = end_screen.get_node("Label")

func _ready() -> void:
	create_tween() \
		.tween_property(bar, "size", Vector2(0, 22), game_timer) \
		.set_trans(Tween.TRANS_SINE) \
		.set_ease(Tween.EASE_OUT)

	await get_tree().create_timer(game_timer).timeout
	ui.hide()
	customer_root.hide()
	end_screen.show()
	
	await get_tree().create_timer(2).timeout
	fade_out(silhouette, 2)
	await get_tree().create_timer(3).timeout
	if main.score > 0:
		scorefinal.text = "SCORE: " + str(main.score) + "\nGIGACHAD-INELLA APPROVES"
	else:
		scorefinal.text = "SCORE: " + str(main.score) + "\nGIGACHAD-INELLA DISAPPROVES >:C"
	
	create_tween() \
		.tween_property(scorefinal, "visible_ratio", 1.0, 4) \
		.set_trans(Tween.TRANS_SINE) \
		.set_ease(Tween.EASE_OUT)
	
	await get_tree().create_timer(6).timeout
	get_tree().quit()
	
	
func fade_out(rect: TextureRect, time := 0.5) -> void:
	var t := create_tween()
	t.tween_property(rect, "modulate:a", 0.0, time)\
		.set_trans(Tween.TRANS_SINE)\
		.set_ease(Tween.EASE_OUT)
