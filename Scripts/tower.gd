extends Node2D

@onready var raycast = $RayCast2D
@export var projectile:PackedScene
var shooting = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if raycast.is_colliding():
		print("Heyooo")
		shooting = true
	else:
		shooting = false
	pass

func shoot():
	var bullet = projectile.instantiate()
	bullet.position = position
	self.get_parent().add_child(bullet)
	pass

func _on_timer_timeout():
	shoot()
	pass # Replace with function body.
