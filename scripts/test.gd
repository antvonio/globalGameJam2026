extends Node

func _ready():
	var inv := Inventory.new()
	var cat = "shapes"
	inv.add_item("test", preload("res://icons/icon.svg"), cat)
	inv.print_items_in_category(cat)
	inv.remove_item("test", cat)
	inv.print_items_in_category(cat)
