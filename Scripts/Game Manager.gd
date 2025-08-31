extends Node

var currency = 128

signal tower_picked(button:TowerPicker,tower:Tower)
@onready var money_label = $Interface/MoneyLabel
@onready var game_over = $Interface/GameOver
@onready var tower_buttons = $Interface/TowerButtons
@onready var pause_scene = $Interface/PauseScene
const tower_select = preload("res://Scenes/tower_picker.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	money_label.text = str(currency)
	for tower in Global.towers:
		var button = tower_select.instantiate() 
		button.tower = tower
		if button.has_signal("tower_picked"):
			button.tower_picked.connect(_pick_tower)
		tower_buttons.add_child(button)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_money(amount, add=true):
	if add:
		currency+=amount
	else:
		currency-=amount
	money_label.text = str(currency)


func _on_retry_button_pressed():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_board_game_over():
	game_over.visible = true
	game_over.get_node("VBoxContainer/ROUS-es killed").text = "You killed "+str(Global.rouses_killed)+" ROUSes"
	pass # Replace with function body.
	
func _pick_tower(button:TowerPicker, tower:Tower):
	emit_signal("tower_picked",button,tower)


func _on_pause_button_pressed():
	Engine.time_scale = 0
	pause_scene.visible = true
	pass # Replace with function body.
