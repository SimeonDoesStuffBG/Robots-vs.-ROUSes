extends Tower_Module

@onready var enemy_detector = $RayCast2D
@onready var timer = $Timer

var range:float
var shooting = false

var projectile:
	get: return stats.projectile
# Called when the node enters the scene tree for the first time.
func _ready():
	assert(stats is Damage, "The module must be damage")
	self.range = min(get_parent().range,stats.range*Global.tile_space)
	enemy_detector.target_position.x = range
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
	get_tree().get_root().add_child(bullet)
	if shooting:
		timer.start(stats.shoot_speed)
	pass
	

func _on_timer_timeout():
	shoot()
	pass # Replace with function body.
