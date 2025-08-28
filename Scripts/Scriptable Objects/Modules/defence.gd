class_name Defence
extends Module

@export var wall_health = 1000

func _init():
	scene = preload("res://Scenes/defence.tscn")
	health += wall_health
