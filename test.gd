extends Node

func _ready():
	var inv := Inventory.new()
	inv.get_items_by_category()
