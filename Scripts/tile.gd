extends ColorRect

var tower
var has_tower : bool :
	get:
		return self.tower != null

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_mouse_entered():
	self.get_parent().active_tile = self
	self.visible = true
	#print(self.get_parent().active_tile.position)
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	if(self.get_parent().active_tile==self):
		self.get_parent().active_tile = null
	self.visible = false
	pass # Replace with function body.
