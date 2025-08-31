extends Node

const tile_size = 30.0
const tile_margin = 2.0
var tile_space:
	get:
		return tile_size+tile_margin
var rouses_killed = 0
@export var towers = [
	load("res://Assets/Towers/damage_tower.tres"),
	load("res://Assets/Towers/producer_tower.tres"),
	load("res://Assets/Towers/defence_tower.tres"),
	load("res://Assets/Towers/explosive_tower.tres")
]
