class_name DamageZone
extends Area2D

@export var damage = 10
signal dealing_damage
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func deal_damage(target):
	target.take_damage(damage)

func _on_body_entered(body):
	print("Meep")
	deal_damage(body)
	emit_signal("dealing_damage")
	pass # Replace with function body.
