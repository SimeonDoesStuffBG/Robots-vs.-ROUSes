extends Node2D

var node_size = 34.0

@export var height = 5
@export var width = 9

@export var tile:PackedScene

@export var light_color:Color
@export var dark_color:Color
# Called when the node enters the scene tree for the first time.
func _ready():
	var bottom_left = Vector2(-width * node_size / 2, -height * node_size / 2)
	
	for i in height:
		var y_offset = i * node_size
		for j in width:
			var x_offset = j * node_size
			position = bottom_left + Vector2(x_offset, y_offset)
			
			var tile_node = tile.instantiate()
			
			tile_node.position = position
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
	
