extends Tower_Module

@onready var timer = $Timer
var resource:
	get:return stats.resource
# Called when the node enters the scene tree for the first time.
func _ready():
	assert(stats is Producer, "Module must be a producer")
	super._ready()
	timer.start(stats.initial_delay)
	animated_sprite.play("idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func produce():
	var bolts = resource.instantiate()
	bolts.position = global_position
	bolts.game_manager = get_parent().board.game_manager
	drain_power(stats.energy_drain)
	get_parent().board.add_child(bolts)
	timer.start(stats.produce_delay)
	animated_sprite.play("idle")


func _on_timer_timeout():
	if has_power:
		animated_sprite.play("producing")
		produce()
	pass # Replace with function body.
