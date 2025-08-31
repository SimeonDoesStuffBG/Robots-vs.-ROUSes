extends Node2D

@onready var animated_sprite = $AnimatedSprite2D
var activated = false
var speed = 70
# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.play("idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if activated:
		self.translate(Vector2.RIGHT * speed * delta)
	pass

func _on_area_2d_area_entered(area):
	area.get_parent().queue_free()
	activated = true
	animated_sprite.play("attack")
	pass # Replace with function body.
