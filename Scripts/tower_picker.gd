class_name TowerPicker
extends Button

@export var tower:Tower
@onready var timer = $Timer
@onready var game_manager = $"../../.."
@onready var recharge_indicator = $"Recharge Indicator"

signal tower_picked(button:Button,tower:Tower)
var cooldown_time:float
var price:int
var can_aford: 
	get: return self.price <= game_manager.currency
var on_cooldown:
	get: return self.timer.time_left > 0
# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(_on_pressed)
	cooldown_time = tower.cooldown
	price = tower.price
	self.text = str(price)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.disabled = not can_aford || on_cooldown
	if on_cooldown:
		self.tooltip_text = "On cooldown"
		recharge_indicator.size.y = self.size.y * (timer.wait_time - timer.time_left) / timer.wait_time
	elif not can_aford:
		self.tooltip_text = "Can not afford this tower"
		recharge_indicator.visible = false
	else:
		self.tooltip_text = ""
		recharge_indicator.visible = false
	pass

func cooldown():
	self.release_focus()
	recharge_indicator.visible = true
	recharge_indicator.size.y = 0
	self.disabled = true
	self.timer.start(cooldown_time)
	pass

func _on_pressed():
	emit_signal("tower_picked",self,tower)
	pass # Replace with function body.
