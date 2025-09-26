extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_main_menu_button_pressed():
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	pass # Replace with function body.


func _on_continue_button_pressed():
	Engine.time_scale = 1
	self.visible = false
	pass # Replace with function body.


func _on_retry_button_pressed():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
	pass # Replace with function body.
