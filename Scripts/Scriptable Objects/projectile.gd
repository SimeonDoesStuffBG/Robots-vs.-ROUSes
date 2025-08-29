class_name Projectile
extends Resource

const scene = preload("res://Scenes/projectile.tscn")
@export var speed = 100
@export var damage = 10
@export var is_explosive = false
@export var explosive_radius = 1.5
@export var sprite:Texture2D

func instantiate(position:Vector2):
	var instance = scene.instantiate()
	instance.position = position
	instance.stats = self
	return instance
