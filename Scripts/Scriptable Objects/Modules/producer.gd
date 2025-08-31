class_name Producer
extends WorkingModule

const resource = preload("res://Scenes/currency_pack.tscn")
@export var produce_delay=15
@export var initial_delay=5
func _init():
	self.scene = preload("res://Scenes/producer.tscn")
	self.name = "Producer"
