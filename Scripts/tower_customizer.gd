extends Button

var tower:Tower

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = str(tower.price)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = str(tower.price)
	pass
