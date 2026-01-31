extends CharacterBody2D

@export var min_rotation_speed: float = -2.0 #radianti al secondo
@export var max_rotation_speed: float = 2.0 #radianti al secondo

var rotation_speed: float

func _ready():
	rotation_speed = randf_range(min_rotation_speed, max_rotation_speed)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	rotation += rotation_speed * delta


	move_and_slide()

	if position.y > get_viewport_rect().size.y + 50:
		queue_free() #Elimina lo sprite quando esce dallo schermo