extends Control

@onready var name_label: Label = $Panel/VBoxContainer/NameLabel
@onready var text_label: RichTextLabel = $Panel/VBoxContainer/TextLabel
@onready var next_button: Button = $Panel/VBoxContainer/NextButton

var lines: Array[String] = []
var index: int = 0

func start_dialogue(speaker: String, dialogue_lines: Array[String]) -> void:
	lines = dialogue_lines
	index = 0
	name_label.text = speaker
	text_label.text = lines[index]
	visible = true

func _on_next_button_pressed() -> void:
	index += 1
	if index >= lines.size():
		end_dialogue()
	else:
		text_label.text = lines[index]

func end_dialogue() -> void:
	visible = false

func _ready():
	var d = get_tree().get_first_node_in_group("DialogueBox")
	print(d)