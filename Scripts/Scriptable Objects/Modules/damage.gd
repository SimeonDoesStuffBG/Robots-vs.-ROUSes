class_name Damage
extends Module

@export var projectile: PackedScene
@export var shoot_speed = 1
@export var range = 2

func _init():
	self.scene = preload("res://Scenes/damage.tscn")
	pass
