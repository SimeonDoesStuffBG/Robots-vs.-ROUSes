extends Node2D

var speed = 40;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	self.translate(Vector2.RIGHT * speed * delta)
	pass


func _on_damage_zone_dealing_damage():
	self.queue_free();
	pass # Replace with function body.
