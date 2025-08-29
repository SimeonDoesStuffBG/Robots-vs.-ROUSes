extends Tower_Module

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(stats is Batery, "Stats Must be battery")
	super._ready()
	animated_sprite.play("full")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func quarters():
	animated_sprite.play("quarter")


func half():
	animated_sprite.play("half")
	

func quarter():
	animated_sprite.play("quarter")
	

func emptying():
	animated_sprite.play("emptying")
	
func recharging():
	animated_sprite.play("rechargin")

func recharge():
	animated_sprite.play("full")
