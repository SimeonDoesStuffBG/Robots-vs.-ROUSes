class_name Producer
extends Module

const resource = preload("res://Scenes/currency_pack.tscn")
@export var produce_delay=7.5
@export var initial_delay=4
func _init():
	scene = preload("res://Scenes/producer.tscn")
