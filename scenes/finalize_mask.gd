extends Control

@export var score: int = 0
@onready var main := get_tree().current_scene
@onready var customer_root := main.get_node("Customer") as CanvasItem
@onready var mask_builder := main.get_node("UI") as CanvasItem

@onready var scoreLabel := customer_root.get_node("ScoreDisplay")
@onready var main_mask_mng = mask_builder.get_node("MaskManager") 
@onready var request_mask = customer_root.request_mask
@onready var finalizeButton = mask_builder.get_node("FinalizeMask")
@onready var main_mask = main_mask_mng.mask

func _ready() -> void:
	finalizeButton.pressed.connect(deliver_mask)
	
func _process(delta: float) -> void:
	scoreLabel.text = "Score: " + str(score)
	
func is_mask_valid():
	return main_mask.content["shapes"] == request_mask.content["shapes"] and main_mask.content["themes"] == request_mask.content["themes"] and main_mask.content["eyes"] == request_mask.content["eyes"] and main_mask.content["tops"] == request_mask.content["tops"]	
		
func deliver_mask():
	mask_builder.hide()
	customer_root.show()
	if is_mask_valid():
		score += 1
		customer_root.animate_sprite(true)
	else:
		score -= 1
		customer_root.animate_sprite(false)
		
	await get_tree().create_timer(2).timeout
	customer_root.spawn_customer_and_request(true)
	
