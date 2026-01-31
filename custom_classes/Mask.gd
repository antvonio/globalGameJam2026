# cosi si fa testa di merda
extends Resource
class_name Mask

var content := {
	"shapes": null,
	"themes": null,
	"eyes": null,
	"mouths": null,
	"tops": null
}

signal mask_changed(attribute: String, texture: Texture2D)

# sarebbe il metodo .new() della classe (il costruttore)
func _init():
	pass
	
# funzione per impostare un attributo alla maschera
func compose_mask(item_texture: Texture2D, attribute: String) -> void:
	print("compose called")
	content[attribute] = item_texture
	emit_signal("mask_changed", attribute, item_texture)
	
# in questa funzione "finalizziamo" la maschera, ovvero
# andiamo a controllare la richiesta del cliente
# stimiamo il valore della maschera
# si vende e poi l'oggetto maschera viene azzerato
# e tutte le proprietà tornano a stringhe vuote
func finalize_content():
	pass
