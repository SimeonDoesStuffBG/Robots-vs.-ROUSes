class_name Damage
extends WorkingModule

@export var projectile:Projectile
@export var shoot_speed = 1
@export var range = 20

func _init():
	self.scene = preload("res://Scenes/damage.tscn")
	pass
