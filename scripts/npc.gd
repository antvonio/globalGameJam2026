extends Node2D

@export var speaker_name := "Artigiano"
@export var dialogue_lines := [
	"Benvenuto.",
	"Questa maschera è molto antica.",
	"Scegli con attenzione."
]

func interact():
	var dialogue_box = get_tree().get_first_node_in_group("DialogueBox")
	dialogue_box.start_dialogue(speaker_name, dialogue_lines)