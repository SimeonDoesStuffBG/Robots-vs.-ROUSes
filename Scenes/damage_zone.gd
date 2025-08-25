extends Area2D

@export var target:PackedScene
@export var damage = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func deal_damage():
	target.take_damage(damage)
