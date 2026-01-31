# cosi si fa testa di merda
extends Resource
class_name Inventory

var inventory: Dictionary = {
	"shapes": [],
	"themes": [],
	"eyes": [],
	"mouths": [],
	"tops": []
}

# sarebbe il metodo .new() della classe (il costruttore)
func _init():
	pass
	
# metodo che crea un oggetto e lo aggiunge all'inventario
func add_item(name: String, icon: Texture2D, category: String):
	var itemTest := Item.new()
	itemTest.name = name
	itemTest.icon = icon

	inventory[category].append(itemTest)

# funzione per rimuovere un oggetto
func remove_item(name: String, category: String):
	var items: Array = inventory[category]
	for i in range(items.size()):
		if items[i].name == name:
			items.remove_at(i)
			return
			
func print_items_in_category(category: String):
	if inventory[category].size() <= 0:
		print("Inventory Empty!")
		return
		
	for item in inventory[category]:
		print(item.name)
		# print("\n")
		
# questa funzione restituisce gli oggetti di una categoria dell'inventario
func get_items_by_category(category: String):
	return inventory[category]
