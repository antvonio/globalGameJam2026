extends Resource
class_name Inventory

var inventory: Array[Item] = []

func _init():
	var itemTest := Item.new()
	itemTest.name = "Test"
	itemTest.icon = load("res://icon.svg")
	itemTest.category = "default"

	inventory.append(itemTest)

func get_items_by_category():
	for item in inventory:
		print(item.name)
