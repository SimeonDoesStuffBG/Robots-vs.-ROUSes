extends Control

@onready var module_picker = $ModulePicker
@onready var tower_customizers = $Tower_customizers
const tower_editor = preload("res://Scenes/tower_customizer.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for tower in Global.towers:
		var button = tower_editor.instantiate()
		button.tower = tower
		button.pressed.connect(_on_edit_tower.bind(tower))
		tower_customizers.add_child(button)
		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_edit_tower(tower):
	module_picker.tower = tower
	module_picker.setup_tower()
	module_picker.visible = true
	pass # Replace with function body.


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level.tscn")
	pass # Replace with function body.
