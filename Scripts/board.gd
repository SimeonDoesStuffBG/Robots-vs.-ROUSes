extends Node2D

var node_size = 34.0
var margin = 2.0
var node_space:float :
	get:
		return node_size+margin

@export var height = 5
@export var width = 9

@export var tile:PackedScene
@export var tower:PackedScene

@export var light_color:Color
@export var dark_color:Color
var active_tile
var enemy_spawner
# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_spawner = self.get_child(0)
	enemy_spawner.initialize(height,node_space)
	
	var bottom_left = Vector2(-width * node_space / 2, -height * node_space / 2)
	
	for i in height:
		var y_offset = i * node_space
		for j in width:
			var x_offset = j * node_space
			var pos = bottom_left + Vector2(x_offset, y_offset)
			
			var tile_node = tile.instantiate()
			
			tile_node.position = pos
			tile_node.size = Vector2(node_size, node_size)
			
			if i%2==j%2:
				tile_node.color = light_color 
			else: 
				tile_node.color = dark_color
			
			add_child(tile_node)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func create_tower():
	var tower_object = tower.instantiate()
	tower_object.position = active_tile.position + Vector2(node_size/2, node_size/2)
	add_child(tower_object)
	pass

func _on_button_pressed():
	pass # Replace with function body.

func _input(event):
	if Input.is_action_just_pressed("left_click") && active_tile != null:
		if not active_tile.has_tower:
			print("Hello there")
			create_tower()
			active_tile.has_tower = true;
		else:
			print("General Kenobi")
	pass
