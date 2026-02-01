extends Panel

# Frame
@onready var TopBar = $TopBar
@onready var Content = $Content

# Templates
@onready var ItemButton = preload("res://scenes/ItemButton.tscn")
@onready var TopBarButton = preload("res://scenes/TopBarButton.tscn")

@onready var inv_manager: Node2D = get_parent().get_node("InventoryManager")
@onready var MaskManager = get_parent().get_node("MaskManager")

var selected_category = "shapes"
	
func _ready() -> void:
	inv_manager.inventory_ready.connect(load_category)
	for category in inv_manager.inventory.content.keys():
		var newButton: Button = TopBarButton.instantiate()
		newButton.text = category
		
		newButton.pressed.connect(load_category.bind(category))
		TopBar.add_child(newButton)
		print(" - ", category)
		
func clear_content():
	for child in Content.get_children():
		child.queue_free()
		
func load_category(category: String):
	selected_category = category
	clear_content()
	var items = inv_manager.inventory.get_items_by_category(selected_category)
	for item in items:
		var newButton: TextureButton = ItemButton.instantiate()
		# newButton.text = ""
		newButton.get_node("Texture").texture = item.icon
		newButton.pressed.connect(MaskManager.mask.compose_mask.bind(item.icon, item.category))
		Content.add_child(newButton)
		print(" - ", item.name)
			
	
