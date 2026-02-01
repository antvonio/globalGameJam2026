extends Resource
class_name Customer

var data = {
	"icon" = "",
}

# Called when the node enters the scene tree for the first time.
func _init():
	pass # Replace with function body.

func new_customer(customerTexture: String):
	data["icon"] = load(customerTexture)
	
