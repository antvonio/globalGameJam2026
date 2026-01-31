extends TextureButton

@onready var mask_pieces := get_parent()
@onready var pieces_container: Control = mask_pieces.get_node("Content") as Control
@onready var colors_container: Control = mask_pieces.get_node("ColorContent") as Control

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	# toggle: uno ON e l'altro OFF
	var show_pieces := not pieces_container.visible
	pieces_container.visible = show_pieces
	colors_container.visible = not show_pieces
