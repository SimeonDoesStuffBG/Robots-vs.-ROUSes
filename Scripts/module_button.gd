extends Button

@export var module: Module
signal module_picked(module:Module)
@onready var information = $Information

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = module.name
	self.icon = module.icon
	information.get_node("Name Label").text = module.name
	information.get_node("Price_Label").text = "Price: "+str(module.price)
	information.get_node("Recharge_Label").text = "Recharge time: "+str(module.cooldown)
	information.get_node("Health label").text = "Health: "+str(module.health)
	information.get_node("info").text = module.info
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	emit_signal("module_picked", self.module)
	pass # Replace with function body.


func _on_mouse_entered():
	information.visible=true
	pass # Replace with function body.


func _on_mouse_exited():
	information.visible=false
	pass # Replace with function body.
