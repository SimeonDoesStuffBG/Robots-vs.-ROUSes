extends Control

const module_picker = preload("res://Scenes/module_picker.tscn")
@onready var tower_customizers = $Tower_customizers
var towers:Array[Tower]
signal edit_tower(tower)
# Called when the node enters the scene tree for the first time.
func _ready():
	for button in tower_customizers.get_children():
		var new_tower = Tower.new()
		towers.push_back(new_tower)
		button.pressed.connect(emit_signal("edit_tower",new_tower))
		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_edit_tower(tower):
	var picker = module_picker.instantiate()
	picker.tower = tower
	add_child(picker)
	pass # Replace with function body.
