class_name Explosive
extends WorkingModule

@export var explosion_radius = 1.5
@export var is_instant = true

func _init():
	self.scene = preload("res://Scenes/explosive.tscn")
