extends Control

@export var target_position_y: float = 50.0
@export var duration: float = 2.0
@export var request_delay: float = 3.0
@export var current_customer: String

const customers = [
	{"name": "monster", "icon": preload("res://icons/customerSceneAssets/customers/monsterIdle.png")},
	{"name": "gene", "icon": preload("res://icons/customerSceneAssets/customers/gene.png"), "happy": preload("res://icons/customerSceneAssets/customers/gene_happy.png"), "angry": preload("res://icons/customerSceneAssets/customers/gene_angry.png")},
	{"name": "collector_goblin", "icon": preload("res://icons/customerSceneAssets/customers/collector_goblin.png"), "happy": preload("res://icons/customerSceneAssets/customers/collector_goblin_happy.png"), "angry": preload("res://icons/customerSceneAssets/customers/collector_goblin_angry.png")},
	{"name": "oldbat", "icon": preload("res://icons/customerSceneAssets/customers/oldbat.png"), "happy": preload("res://icons/customerSceneAssets/customers/oldbat_happy.png"), "angry": preload("res://icons/customerSceneAssets/customers/oldbat_angry.png")},
	{"name": "gman", "icon": preload("res://icons/customerSceneAssets/customers/gman.png"), "happy": preload("res://icons/customerSceneAssets/customers/gman_happy.png"), "angry": preload("res://icons/customerSceneAssets/customers/gman_angry.png")},
]

@onready var customerSprite: TextureRect = $CustomerSprite
@onready var requestedMaskSprite = $RequestedMask

@onready var acceptButton: Button = requestedMaskSprite.get_node("AcceptButton")
@onready var refuseButton: Button = requestedMaskSprite.get_node("RefuseButton")
@onready var main := get_tree().current_scene
@onready var ui := main.get_node("UI") as CanvasItem
@onready var customer_root := main.get_node("Customer") as CanvasItem

@onready var req_shape: TextureRect = requestedMaskSprite.get_node("Shape")
@onready var req_theme: TextureRect = requestedMaskSprite.get_node("Theme")

var maskbuilder_scene_path = "res://scenes/project.tscn"
var start_pos = Vector2(56, 500)
var request_mask: Mask = Mask.new()  # maschera richiesta (non quella composta dal player)

func _apply_mask_to_theme() -> void:
	# Lo shader/materiale deve stare sul THEME
	var mat := req_theme.material as ShaderMaterial
	if mat == null:
		push_error("Theme non ha ShaderMaterial!")
		return
	if req_shape.texture == null:
		return

	# IMPORTANT: se stai istanziando più richieste/scene, evita materiale condiviso
	# (puoi farlo una volta sola in _ready, ma qui è safe)
	req_theme.material = req_theme.material.duplicate()
	mat = req_theme.material as ShaderMaterial

	mat.set_shader_parameter("mask_tex", req_shape.texture)

func _ready() -> void:
	print(main)
	refuseButton.pressed.connect(refuse_customer)
	acceptButton.pressed.connect(accept_customer)
	await spawn_customer_and_request(false)
	
func tween_customer() -> void:
	var end := customerSprite.position
	end.y = target_position_y

	create_tween() \
		.tween_property(customerSprite, "position", end, duration) \
		.set_trans(Tween.TRANS_SINE) \
		.set_ease(Tween.EASE_OUT)

func new_customer() -> void:
	var random_customer: Dictionary = customers.pick_random()
	current_customer = random_customer.name
	customerSprite.texture = random_customer["icon"]
	tween_customer()

func spawn_customer_and_request(new) -> void:
	requestedMaskSprite.hide()
	if new:
		create_tween() \
		.tween_property(customerSprite, "position", start_pos, 3) \
		.set_trans(Tween.TRANS_SINE) \
		.set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(3).timeout
		
	new_customer()

	# ✅ aspetta 3 secondi
	await get_tree().create_timer(request_delay).timeout
	
	requestedMaskSprite.visible = true
	# ✅ genera richiesta casuale (per ora random puro)
	generate_random_request()

func animate_sprite(happy: bool):
	if current_customer == "monster":
		return
		
	var customerData 
	for customer in customers:
		if customer.name == current_customer:
			customerData = customer
			break
	if happy:
		customerSprite.texture = customerData.happy
	else:
		customerSprite.texture = customerData.angry
		
func update_mask_sprite():
	requestedMaskSprite.hide()
	req_shape.texture = request_mask.content["shapes"]
	requestedMaskSprite.get_node("Eyes").texture = request_mask.content["eyes"]
	req_theme.texture = request_mask.content["themes"]
	requestedMaskSprite.get_node("Top").texture = request_mask.content["tops"]

	_apply_mask_to_theme()
	requestedMaskSprite.show()
		
func generate_random_request() -> void:
	requestedMaskSprite.show()
	# qui puoi decidere cosa significa "richiesta casuale"
	# esempio: sceglie una categoria a caso e una texture a caso (o una lista di tag)
	request_mask.content["shapes"] = G_ItemDB.SHAPES.pick_random().icon
	request_mask.content["themes"] = G_ItemDB.THEMES.pick_random().icon
	request_mask.content["eyes"]   = G_ItemDB.EYES.pick_random().icon
	request_mask.content["tops"]   = G_ItemDB.ACCESSORIES.pick_random().icon
	
	update_mask_sprite()

	print("Richiesta generata!")

func accept_customer() -> void:
	requestedMaskSprite.hide()
	customer_root.hide()
	ui.show()

	
func refuse_customer():
	print("!!!!!!!!!!")
	await spawn_customer_and_request(true)
