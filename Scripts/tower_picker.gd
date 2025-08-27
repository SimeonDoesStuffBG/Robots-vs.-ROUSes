class_name TowerPicker
extends Button

@export var tower: PackedScene
@onready var timer = $Timer
@onready var game_manager = %"Game Manager"

signal tower_picked(button:Button,tower)
var cooldown_time:float
var price:int
var can_aford: 
	get: return self.price <= game_manager.currency
var on_cooldown:
	get: return self.timer.time_left > 0
# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(_on_pressed)
	var tower_instance = tower.instantiate()
	cooldown_time = tower_instance.stats.cooldown
	price = tower_instance.stats.price
	self.text = str(price)
	self.icon = tower_instance.stats.icon
	tower_instance.queue_free() 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.disabled = not can_aford || on_cooldown
	if not can_aford:
		self.tooltip_text = "Can not afford this tower"
	elif on_cooldown:
		self.tooltip_text = "On cooldown"
	else:
		self.tooltip_text = ""
	pass

func cooldown():
	self.release_focus()
	self.disabled = true
	self.timer.start(cooldown_time)
	pass

func _on_pressed():
	emit_signal("tower_picked",self,tower)
	pass # Replace with function body.

