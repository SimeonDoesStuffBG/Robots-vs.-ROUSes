class_name Enemy
extends Resource

@export var name:String
@export var health = 100
@export var speed = 20
@export var damage = 20
@export var animation:SpriteFrames
const scene = preload("res://Scenes/enemy.tscn")

func instantiate(position:Vector2):
	var enemy = scene.instantiate()
	enemy.stats = self
	enemy.position = position
	return enemy
