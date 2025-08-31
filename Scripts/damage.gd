extends Tower_Module

@onready var enemy_detector = $RayCast2D
@onready var timer = $Timer
@onready var gunshot = $Gunshot

var range:float
var shooting = false

var projectile:
	get: return self.stats.projectile
# Called when the node enters the scene tree for the first time.
func _ready():
	assert(stats is Damage, "The module must be damage")
	super._ready()
	self.range = min(get_parent().range,stats.range*Global.tile_space)
	enemy_detector.target_position.x = range
	animated_sprite.play("idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enemy_detector.is_colliding():
		if not shooting:
			animated_sprite.play("shooting")
			shooting = true
			timer.start(0.1)
	else:
		animated_sprite.play("idle")
		shooting = false
	pass

func shoot():
	var bullet = projectile.instantiate(self.global_position)
	get_parent().board.add_child(bullet)
	drain_power(stats.energy_drain)
	gunshot.play()
	if shooting:
		timer.start(stats.shoot_speed)
	pass
	

func _on_timer_timeout():
	if has_power:
		shoot()
	pass # Replace with function body.
