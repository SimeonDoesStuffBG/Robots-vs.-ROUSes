class_name Tower_Module
extends Node2D

@export var stats:Module
@onready var animated_sprite = $AnimatedSprite2D
var has_power:
	get:
		return get_parent().is_active
var power:
	set(value):
		get_parent().charge = value
	get:
		return get_parent().charge

signal out_of_power
# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.sprite_frames = stats.animation
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func drain_power(power_drain):
	power-=power_drain
	if not has_power:
		emit_signal("out_of_power")
