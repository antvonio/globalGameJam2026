extends Sprite2D

@export var speed: float = 200.0 #pixel al secondo

func _process(delta):
	position.y += speed * delta
	if position.y > get_viewport_rect().size.y + 50:
		queue_free() #Elimina lo sprite quando esce dallo schermo
