class_name Explosive
extends Module

@export var explosion_radius = 3
@export var is_instant = true
var is_on_touch:
	set(value):
		is_instant = !value
	get:
		return !is_instant
