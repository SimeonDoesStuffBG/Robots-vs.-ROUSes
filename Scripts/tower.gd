extends Node2D

@export var projectile:PackedScene
@onready var enemy_detector = $RayCast2D
@onready var timer = $Timer
var ray_length:float = 100
var shooting = false
func _ready():
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
