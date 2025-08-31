extends Node2D

@export var enemies:Array[Enemy]
@onready var timer = $Timer

var enemy_spawners: int
var column_height: float
var max_spawnRate = 10.0
var min_spawnRate = 5.0
var spawn_positions: Array[Vector2]
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	spawn_enemy()
	timer.wait_time=randf_range(min_spawnRate,max_spawnRate)
	pass # Replace with function body.

func initialize(_enemies, _column_height):
	enemy_spawners = _enemies
	column_height = _column_height
	self.scale.y = enemy_spawners * column_height
	var bottom = -(enemy_spawners - 1) * column_height / 2
	
	for i in enemy_spawners:
		var y_position = bottom + i * column_height
		spawn_positions.push_back(Vector2(self.position.x, y_position))	
	pass

func spawn_enemy():
	var current_spawn = randi_range(0,enemy_spawners-1)
	var enemy_spawn = randi_range(0,enemies.size()-1)
	var enemy_instance = enemies[0].instantiate(spawn_positions[current_spawn])	
	self.get_parent().add_child(enemy_instance)
	pass


func _on_ramp_up_timeout():
	if min_spawnRate > 1.0:
		min_spawnRate -= 0.1
		max_spawnRate -= 3.0 / 16.0
		get_node("Ramp up").start()
	pass # Replace with function body.
