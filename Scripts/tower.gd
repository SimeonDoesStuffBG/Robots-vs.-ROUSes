extends Node2D

@export var projectile:PackedScene
@onready var enemy_detector = $RayCast2D
@onready var timer = $Timer

func _ready():
	timer.start()
	pass

func _process(delta):
	if enemy_detector.is_colliding():
		print("AAAAAAAAAAA")
	#	timer.start()
	#elif not timer.is_stopped():
	#	timer.stop()
	pass

func shoot():
	var bullet = projectile.instantiate()
	bullet.position = position
	get_parent().add_child(bullet)
	pass

func _on_timer_timeout():
	shoot()
	pass # Replace with function body.
