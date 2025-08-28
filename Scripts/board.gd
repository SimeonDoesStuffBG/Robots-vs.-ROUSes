extends Node2D

@onready var enemy_spawner = $enemy_spawner
@onready var tower_buttons = $"Game Manager/Interface/TowerButtons"
@onready var game_manager = %"Game Manager"
@onready var panel_container = $"Game Manager/Interface/PanelContainer"
@onready var pause_scene = $"Game Manager/Interface/pause_scene"
const final_line = preload("res://Scenes/final_line.tscn")
const tile = preload("res://Scenes/tile.tscn")

var node_size = Global.tile_size
var margin = Global.tile_margin
var node_space:float :
	get:
		return node_size+margin

@export var height = 5
@export var width = 9

var tower:PackedScene

var active_tile
var picked_button

var towerDetectionLimit:float
# Called when the node enters the scene tree for the first time.
func _ready():
	panel_container.visible = false
	enemy_spawner.initialize(height,node_space)
	generate_board()
	
	for button in tower_buttons.get_children():
		if button.has_signal("tower_picked"):
			button.tower_picked.connect(_pick_tower)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func create_tower():
	var tower_object = tower.instantiate()
	tower_object.position = active_tile.position + Vector2(node_size/2, node_size/2) 
	tower_object.range = towerDetectionLimit - tower_object.position.x

	add_child(tower_object)
	active_tile.tower = tower_object
	game_manager.change_money(tower_object.stats.price,false)
	self.tower = null
	self.picked_button.disabled = true
	self.picked_button.cooldown()
	self.picked_button = null
	pass


func _input(event):
	if active_tile==null:
		return
		
	if Input.is_action_just_pressed("left_click") and tower!=null:
		if not active_tile.has_tower:
			create_tower()
	
	if Input.is_action_just_pressed("right_click"):
		if active_tile.has_tower:
			active_tile.tower.queue_free()
			active_tile.tower = null
	pass

func generate_board():
	var bottom_left = Vector2(-width * node_space / 2, -height * node_space / 2)
	towerDetectionLimit = bottom_left.x + (width+1) * node_space
	for i in height:
		var y_offset = i * node_space
		for j in width:
			var x_offset = j * node_space
			var pos = bottom_left + Vector2(x_offset, y_offset)
			
			var tile_node = tile.instantiate()
			
			tile_node.position = pos
			tile_node.size = Vector2(node_size, node_size)
			
			add_child(tile_node)
		
		var final_line_x = -node_space / 4
		var final_line_y = y_offset + node_space/2
		var final_line_pos = bottom_left + Vector2(final_line_x, final_line_y)
		var final_line_obj = final_line.instantiate()
		final_line_obj.position = final_line_pos
		add_child(final_line_obj)
	pass

func _on_bullet_limit_body_entered(body):
	body.queue_free()
	pass # Replace with function body.

func _pick_tower(button, tower):
	if self.tower!=tower:
		self.picked_button = button
		self.tower = tower
	else:
		self.picked_button.release_focus()
		self.picked_button = null
		self.tower = null
	pass # Replace with function body.

func _on_enemy_goal_area_entered(area):
	Engine.time_scale = 0
	panel_container.visible = true
	pass # Replace with function body.


func _on_button_pressed():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_pause_button_pressed():
	Engine.time_scale = 0
	pause_scene.visible = true
	pass # Replace with function body.
