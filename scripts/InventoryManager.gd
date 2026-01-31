extends Node
class_name InventoryManager

signal inventory_ready

@onready var item_db = get_parent().get_node("ItemDB")
var inventory: Inventory = Inventory.new()

func _ready():
	for shape in item_db.SHAPES:
		inventory.add_item(shape.name, shape.icon, "shapes")

	for eyes in item_db.EYES:
		inventory.add_item(eyes.name, eyes.icon, "eyes")

	for accessory in item_db.ACCESSORIES:
		inventory.add_item(accessory.name, accessory.icon, "tops")

	for theme in item_db.THEMES:
		inventory.add_item(theme.name, theme.icon, "themes")

	inventory_ready.emit("shapes")
