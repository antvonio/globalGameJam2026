extends Button

@export var npc_path: NodePath
@onready var npc = get_node(npc_path)

func _pressed():
	npc.start_dialogue()
