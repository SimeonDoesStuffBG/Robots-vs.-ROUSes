extends Tower_Module

@onready var explosion_range = $ExplosionRange/CollisionShape2D
@onready var trigger_range = $TriggerRange

var range:
	get:
		return stats.explosion_radius * Global.tile_space

var items_to_explode: Array[Node2D]
# Called when the node enters the scene tree for the first time.
func _ready():
	assert(stats is Explosive, "Module must be explosive")
	super._ready()
	explosion_range.shape.radius = range
	if stats.is_instant:
		explode()
	pass # Replace with function body.

func explode():
	for item in items_to_explode:
		item.queue_free()
	self.queue_free()
	
func _on_trigger_range_area_entered(area):
	explode()
	pass # Replace with function body.


func _on_explosion_range_area_entered(area):
	items_to_explode.push_back(area.get_parent())
	pass # Replace with function body.


func _on_explosion_range_area_exited(area):
	items_to_explode.erase(area.get_parent())
	pass # Replace with function body.


func _on_timer_timeout():
	if has_power:
		drain_power(stats.energy_drain)
	pass # Replace with function body.


func _on_out_of_power():
	explode()
	pass # Replace with function body.
