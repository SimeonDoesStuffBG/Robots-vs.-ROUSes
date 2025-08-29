class_name Mechanic
extends Module

@export var speed = 10
@export var thoroughness = 1.0

func _init():
	self.scene = preload("res://Scenes/mechanic.tscn")
