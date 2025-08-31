extends ColorRect

const selected_alpha = 0.5
const unselected_alpha = 0
@onready var hitbox = $Area2D/CollisionShape2D

var tower
var has_tower : bool :
	get:
		return self.tower != null

# Called when the node enters the scene tree for the first time.
func _ready():
	self.color.a= unselected_alpha
	hitbox.shape.size = self.size
	hitbox.position = Vector2(self.size.x/2, self.size.y/2)
	self.mouse_entered.connect(_on_area_2d_mouse_entered)
	self.mouse_exited.connect(_on_area_2d_mouse_exited)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_mouse_entered():
	self.get_parent().active_tile = self
	self.color.a= selected_alpha
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	if(self.get_parent().active_tile==self):
		self.get_parent().active_tile = null
	self.color.a= unselected_alpha
	pass # Replace with function body.
