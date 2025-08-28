class_name Module
extends Resource

@export var health = 10.0
@export var price = 16
@export var cooldown = 15.0
@export var icon:Texture2D
@export var animation:SpriteFrames
var scene

func instantiate(position:Vector2):
	assert(scene is Tower_Module, "Invalid scene")
	var instance = scene.instantiate()
	instance.position = position
	instance.stats = self
	return instance
	
