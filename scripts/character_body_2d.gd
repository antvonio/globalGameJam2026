extends CharacterBody2D

@export var min_rotation_speed: float = -2.0
@export var max_rotation_speed: float = 2.0

var rotation_speed: float

@onready var shape: TextureRect = $Shape
@onready var theme: TextureRect = $Theme
@onready var eyes: TextureRect = $Eyes
@onready var mouth: TextureRect = $Mouth
@onready var top: TextureRect = $Top

func _ready() -> void:
	rotation_speed = randf_range(min_rotation_speed, max_rotation_speed)
	theme.material = theme.material.duplicate()  # 1) materiale unico
	randomize_mask() # ✅ appena nasce, si randomizza
	apply_theme_mask()

func randomize_mask() -> void:
	shape.modulate = Color(randf(), randf(), randf(), 1.0)
	shape.texture = G_ItemDB.SHAPES.pick_random().icon
	theme.texture = G_ItemDB.THEMES.pick_random().icon
	eyes.texture  = G_ItemDB.EYES.pick_random().icon
	# mouth.texture = G_ItemDB.MOUTHS.pick_random().icon  # se ce l’hai
	top.texture   = G_ItemDB.ACCESSORIES.pick_random().icon

	apply_theme_mask()

func apply_theme_mask() -> void:
	var mat := theme.material as ShaderMaterial
	if mat == null:
		push_error("Theme non ha ShaderMaterial!")
		return
	if shape.texture == null:
		return
	mat.set_shader_parameter("mask_tex", shape.texture)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	rotation += rotation_speed * delta
	move_and_slide()

	if position.y > get_viewport_rect().size.y + 50:
		queue_free()
