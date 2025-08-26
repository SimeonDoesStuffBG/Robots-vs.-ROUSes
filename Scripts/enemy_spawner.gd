extends Node2D

@export var enemy:PackedScene
@onready var timer = $Timer

var enemies: int
var column_height: float
var spawn_positions: Array[Vector2]
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	spawn_enemy()
	timer.wait_time=randf_range(7.5,10.0)
	pass # Replace with function body.

func initialize(_enemies, _column_height):
	enemies = _enemies
	column_height = _column_height
	self.scale.y = enemies * column_height
	var bottom = -(enemies - 1) * column_height / 2
	
	for i in enemies:
		var y_position = bottom + i * column_height
		spawn_positions.push_back(Vector2(self.position.x, y_position))	
	pass

func spawn_enemy():
	var current_spawn = randi_range(0,enemies-1)
	var enemy_instance = enemy.instantiate()
	enemy_instance.position = spawn_positions[current_spawn]
	
	self.get_parent().add_child(enemy_instance)
	pass
