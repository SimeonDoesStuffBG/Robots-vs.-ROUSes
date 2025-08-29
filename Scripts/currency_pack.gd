extends Node2D

@export var price = 16
var game_manager
var is_selected = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if not is_selected:
		return
	if Input.is_action_just_pressed("left_click"):
		pickup()
	pass

func pickup():
	game_manager.change_money(price)
	self.queue_free()
	pass


func _on_area_2d_mouse_entered():
	is_selected = true
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	is_selected = false
	pass # Replace with function body.


func _on_timer_timeout():
	self.queue_free()
	pass # Replace with function body.
