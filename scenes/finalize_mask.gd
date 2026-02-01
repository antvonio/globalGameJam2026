extends Control

@export var score: int = 0

@onready var main := get_tree().current_scene
@onready var customer_root := main.get_node("Customer")
@onready var mask_builder := main.get_node("UI") as CanvasItem

@onready var scoreLabel: Label = customer_root.get_node("ScoreDisplay") as Label
@onready var main_mask_mng = (mask_builder as Node).get_node("MaskManager")
@onready var finalizeButton = mask_builder.get_node("FinalizeMask")
@onready var sfx: AudioStreamPlayer2D = $Main_theme/Sfx as AudioStreamPlayer2D

@onready var request_mask: Mask = customer_root.get("request_mask") as Mask
@onready var main_mask: Mask = main_mask_mng.get("mask") as Mask

const SFX_CORRECT: AudioStream = preload("res://assets/correct_answer_toy_bi-bling-476370.mp3")
const SFX_WRONG: AudioStream = preload("res://assets/wrong-47985.mp3")

func _ready() -> void:
	finalizeButton.pressed.connect(deliver_mask)
	print(sfx)

func _process(_delta: float) -> void:
	scoreLabel.text = "Score: " + str(score)

func is_mask_valid() -> bool:
	return main_mask.content["shapes"] == request_mask.content["shapes"] \
		and main_mask.content["themes"] == request_mask.content["themes"] \
		and main_mask.content["eyes"] == request_mask.content["eyes"] \
		and main_mask.content["tops"] == request_mask.content["tops"]

func deliver_mask() -> void:
	mask_builder.hide()
	(customer_root as CanvasItem).show()

	if is_mask_valid():
		score += 1
		sfx.stream = SFX_CORRECT
		sfx.play()
		customer_root.call("animate_sprite", true)
	else:
		score -= 1
		sfx.stream = SFX_WRONG
		sfx.play()
		customer_root.call("animate_sprite", false)

	await get_tree().create_timer(2.0).timeout
	await customer_root.call("spawn_customer_and_request", true)
