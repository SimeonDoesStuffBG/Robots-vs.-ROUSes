extends Node2D

@export var stats: Tower

var range:float

var health:int
var is_dead:
	get: return health <= 0

func _ready():
	health = stats.health
	pass

func _process(delta):	
	pass

