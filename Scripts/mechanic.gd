extends Tower_Module


# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	self.animated_sprite.play("idle")
	get_parent().fixing.connect(fixing)
	get_parent().fixed.connect(fixed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fixing():
	animated_sprite.play("fixing")
	
func fixed():
	animated_sprite.play("idle")
