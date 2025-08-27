extends Node2D

@export var stats: Tower

@onready var enemy_detector = $RayCast2D
@onready var timer = $Timer

var ray_length:float
var shooting = false

var health:int
var projectile:
	get: return stats.projectile
var is_dead:
	get: return health <= 0

func _ready():
	health = stats.health
	enemy_detector.target_position.x = ray_length
	pass

func _process(delta):
	if enemy_detector.is_colliding():
		if not shooting:
			shooting = true
			timer.start(0.1)
	else:
		shooting = false
	pass

func shoot():
	var bullet = projectile.instantiate()
	bullet.position = position
	get_parent().add_child(bullet)
	if shooting:
		timer.start(1)
	pass

func _on_timer_timeout():
	shoot()
	pass # Replace with function body.
