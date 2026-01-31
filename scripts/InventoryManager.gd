extends Node
class_name InventoryManager

signal inventory_ready

var inventory: Inventory = Inventory.new()

func _ready():
	inventory.add_item("triple_spiked", preload("res://icons/shapes/triple_spiked.png"), "shapes")
	inventory.add_item("golden_goggles", preload("res://icons/eyes/golden_goggles.png"), "eyes")
	inventory.add_item("scales", preload("res://icons/themes/scales.png"), "themes")
	inventory.add_item("horns", preload("res://icons/tops/horns.png"), "tops")
	inventory_ready.emit()
