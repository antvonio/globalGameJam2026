extends Button

@onready var maskPanel = get_parent().get_parent().get_parent().get_node("Mask")
@onready var shape: TextureRect = maskPanel.get_node("Shape")

func _ready() -> void:
	pressed.connect(_on_pressed)
	print(maskPanel)
	print(shape)
	print(shape.get_node("Shape"))
	
func _on_pressed() -> void:
	var sb := get_theme_stylebox("normal") as StyleBoxFlat
	if sb == null:
		push_error("StyleBoxFlat 'normal' non trovato!")
		return

	shape.modulate = sb.bg_color  # ✅ applica colore
