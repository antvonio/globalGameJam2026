extends Panel

@onready var mask_manager: MaskManager = get_parent().get_node("MaskManager")

@onready var maskPanel = get_parent().get_node("Mask")
@onready var shape: TextureRect = maskPanel.get_node("Shape")
@onready var maskTheme: TextureRect = maskPanel.get_node("Theme")
@onready var eyes: TextureRect = maskPanel.get_node("Eyes")
@onready var mouth: TextureRect = maskPanel.get_node("Mouth")
@onready var top: TextureRect = maskPanel.get_node("Top")

func _ready() -> void:
	mask_manager.mask.mask_changed.connect(_on_mask_changed)

func _on_mask_changed(attribute: String, tex: Texture2D) -> void:
	print("mask_changed")
	match attribute:
		"shapes":
			shape.texture = tex
		"themes":
			maskTheme.texture = tex
		"eyes":
			eyes.texture = tex
		"mouths":
			mouth.texture = tex
		"tops":
			top.texture = tex
