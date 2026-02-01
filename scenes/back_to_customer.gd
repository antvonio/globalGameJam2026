extends Control

@onready var main := get_tree().current_scene
@onready var mask_builder := main.get_node("UI")
@onready var customer_root := main.get_node("Customer")
@onready var toCustomerButton = $BackToCustomer

func _ready() -> void:
	toCustomerButton.pressed.connect(goToCustomerScene)
	
func goToCustomerScene():
	mask_builder.hide()
	customer_root.show()
