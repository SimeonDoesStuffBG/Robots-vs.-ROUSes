extends Tower_Module


# Called when the node enters the scene tree for the first time.
func _ready():
	assert(stats is Defence, "Module must be defence")
	super._ready()
	get_parent().health += stats.wall_health
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	if has_power:
		drain_power(stats.energy_drain)
	pass # Replace with function body.
