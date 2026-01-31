extends Node
class_name ItemDB


const SHAPES = [
	{
		"name": "Triple Spike",
		"icon": preload("res://icons/shapes/triple_spiked.png"),
		"cost": 5,
	},
	{
		"name": "Butterfly",
		"icon": preload("res://icons/shapes/butterfly.png"),
		"cost": 5,
	},
	{
		"name": "Carnival",
		"icon": preload("res://icons/shapes/carnival.png"),
		"cost": 5,
	},
	{
		"name": "Classic",
		"icon": preload("res://icons/shapes/classic.png"),
		"cost": 5,
	},
	{
		"name": "Demon",
		"icon": preload("res://icons/shapes/demon.png"),
		"cost": 5,
	},
	{
		"name": "Half face",
		"icon": preload("res://icons/shapes/half_face.png"),
		"cost": 5,
	},
	{
		"name": "Heart",
		"icon": preload("res://icons/shapes/heart.png"),
		"cost": 5,
	},
	{
		"name": "Mouth",
		"icon": preload("res://icons/shapes/mouth.png"),
		"cost": 5,
	},
	{
		"name": "Squirrel",
		"icon": preload("res://icons/shapes/squirrel.png"),
		"cost": 5,
	},
	{
		"name": "Woman",
		"icon": preload("res://icons/shapes/woman.png"),
		"cost": 5,
	},
]

const EYES = [
	{
		"name": "Golden Goggles",
		"icon": preload("res://icons/eyes/golden_goggles.png"),
		"cost": 5,
	},
	{
		"name": "Bandage Eyes",
		"icon": preload("res://icons/eyes/bandage_eyes.png"),
		"cost": 5,
	},
	{
		"name": "Demon Eyes",
		"icon": preload("res://icons/eyes/demon_eyes.png"),
		"cost": 5,
	},
	{
		"name": "Elegant Eyes",
		"icon": preload("res://icons/eyes/elegant_eyes.png"),
		"cost": 5,
	},
	{
		"name": "Emoji Goggles",
		"icon": preload("res://icons/eyes/emoji_goggles.png"),
		"cost": 5,
	},
	{
		"name": "Flower Eyes",
		"icon": preload("res://icons/eyes/flower_eyes.png"),
		"cost": 5,
	},
	{
		"name": "Heart Goggles",
		"icon": preload("res://icons/eyes/heart_goggles.png"),
		"cost": 5,
	},
	{
		"name": "Spiny Eyes",
		"icon": preload("res://icons/eyes/spiny_eyes.png"),
		"cost": 5,
	},
	{
		"name": "Suffering Eyes",
		"icon": preload("res://icons/eyes/suffering_eyes.png"),
		"cost": 5,
	},
	{
		"name": "Void Eyes",
		"icon": preload("res://icons/eyes/void_eyes.png"),
		"cost": 5,
	}
]

#Top e themes
const ACCESSORIES = [
	{
		"name": "Cross",
		"icon": preload("res://icons/tops/cross.png"),
		"cost": 5,
	},
	{
		"name": "Crown",
		"icon": preload("res://icons/tops/crown.png"),
		"cost": 5,
	},
	{
		"name": "Feather",
		"icon": preload("res://icons/tops/feather.png"),
		"cost": 5,
	},
	{
		"name": "Flakes",
		"icon": preload("res://icons/tops/flakes.png"),
		"cost": 5,
	},
	{
		"name": "Flowers",
		"icon": preload("res://icons/tops/flowers.png"),
		"cost": 5,
	},
	{
		"name": "Heart",
		"icon": preload("res://icons/tops/heart.png"),
		"cost": 5,
	},
	{
		"name": "Horns",
		"icon": preload("res://icons/tops/horns.png"),
		"cost": 5,
	},
	{
		"name": "Lab Goggles",
		"icon": preload("res://icons/tops/lab_goggles.png"),
		"cost": 5,
	},
	{
		"name": "Moons",
		"icon": preload("res://icons/tops/moons.png"),
		"cost": 5,
	},
	{
		"name": "Mouse Ears",
		"icon": preload("res://icons/tops/mouse_Ears.png"),
		"cost": 5,
	},
	{
		"name": "Mustache",
		"icon": preload("res://icons/tops/mustaches.png"),
		"cost": 5,
	},
	{
		"name": "Reindeer Horns",
		"icon": preload("res://icons/tops/reindeer_horns.png"),
		"cost": 5,
	},
	{
		"name": "Ribbon",
		"icon": preload("res://icons/tops/ribbon.png"),
		"cost": 5,
	},
	{
		"name": "Bowtie",
		"icon": preload("res://icons/tops/crown.png"),
		"cost": 5,
	},
	{
		"name": "Tophat",
		"icon": preload("res://icons/tops/tophat.png"),
		"cost": 5,
	}
]

const THEMES = [
	{
		"name": "Dragon Scales",
		"icon": preload("res://icons/themes/scales.png"),
		"cost": 5,
	},
	{
		"name": "Diamonds",
		"icon": preload("res://icons/themes/diamonds.png"),
		"cost": 5,
	},
	{
		"name": "Elegant",
		"icon": preload("res://icons/themes/elegant.png"),
		"cost": 5,
	},
	{
		"name": "Flowers",
		"icon": preload("res://icons/themes/flowers.png"),
		"cost": 5,
	},
	{
		"name": "Netted",
		"icon": preload("res://icons/themes/netted.png"),
		"cost": 5,
	},
	{
		"name": "Pois",
		"icon": preload("res://icons/themes/pois.png"),
		"cost": 5,
	},
	{
		"name": "Puzzle",
		"icon": preload("res://icons/themes/puzzle.png"),
		"cost": 5,
	},
	{
		"name": "Skulls",
		"icon": preload("res://icons/themes/skulls.png"),
		"cost": 5,
	},
	{
		"name": "Squares",
		"icon": preload("res://icons/themes/squares.png"),
		"cost": 5,
	},
	{
		"name": "Stars",
		"icon": preload("res://icons/themes/stars.png"),
		"cost": 5,
	},
	{
		"name": "Zebra",
		"icon": preload("res://icons/themes/zebra.png"),
		"cost": 5,
	}
]
