extends Node2D

@onready var tower_detector = $RayCast2D
@export var health = 100
@export var speed = 15
var moving = true
var attacking:bool :
	set(value):
		moving = !value
	get:
		return !moving
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving:
		self.translate(Vector2.LEFT * speed * delta)
		
	if tower_detector.is_colliding():
		attacking = true
	else:
		attacking = false
	pass


func _on_area_2d_body_entered(body):
	self.health -= body.damage
	body.queue_free()
	if self.health <= 0:
		self.queue_free()
	pass # Replace with function body.
