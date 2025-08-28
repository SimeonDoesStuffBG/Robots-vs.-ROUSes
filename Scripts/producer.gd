extends Tower_Module

@onready var timer = $Timer
var resource:
	get:return stats.resource
# Called when the node enters the scene tree for the first time.
func _ready():
	assert(stats is Producer, "Module must be a producer")
	timer.start(stats.initial_delay)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func produce():
	var bolts = resource.instantiate()
	bolts.position = position
	get_tree().get_root().add_child(bolts)
	timer.start(stats.produce_delay)

func _on_timer_timeout():
	produce()
	pass # Replace with function body.
