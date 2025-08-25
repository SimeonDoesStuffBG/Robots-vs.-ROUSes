class_name Damagable
extends Area2D

@export var health = 100.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func take_damage(_damage):
	self.health -= _damage
	if(self.health <= 0):
		die()

func die():
	self.get_parent().queue_free()
	pass



func _on_body_entered(body):
	if body.name=="DamageZone":
		print("meow")
		take_damage(body.damage)
		
	pass # Replace with function body.
