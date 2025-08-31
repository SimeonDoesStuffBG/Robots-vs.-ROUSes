extends Tower_Module

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(stats is Batery, "Stats Must be battery")
	super._ready()
	animated_sprite.play("full") 
	get_parent().fixing.connect(recharging)
	get_parent().fixed.connect(recharge)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(power < 0.75 * stats.charge):
		animated_sprite.play("quarters")
	elif(power < 0.5 * stats.charge):
		animated_sprite.play("half")
	elif(power < 0.25 * stats.charge):
		animated_sprite.play("quarter")
	elif(power < 0.05 * stats.charge):
		animated_sprite.play("emptying")
	pass

func quarters():
	animated_sprite.play("quarters")

func half():
	animated_sprite.play("half")
	

func quarter():
	animated_sprite.play("quarter")
	

func emptying():
	animated_sprite.play("emptying")
	
func recharging():
	animated_sprite.play("recharging")

func recharge():
	animated_sprite.play("full")
