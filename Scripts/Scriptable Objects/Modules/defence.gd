class_name Defence
extends WorkingModule

@export var wall_health = 200.0

func _init():
	self.health += wall_health
	self.scene = preload("res://Scenes/defence.tscn")
