extends ColorRect

const selected_alpha = 194.0/255.0
const unselected_alpha = 0

var tower:Tower
var has_tower : bool :
	get:
		return self.tower != null

# Called when the node enters the scene tree for the first time.
func _ready():
	self.color.a= unselected_alpha
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
