extends Node2D

@onready var TowerDetector = $RayCast2D
var speed = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.translate(Vector2.LEFT * speed * delta)
	pass


func _on_area_2d_body_entered(body):
	print("I am the globglobgabgalab")
	pass # Replace with function body.
