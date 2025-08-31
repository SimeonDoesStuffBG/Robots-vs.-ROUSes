class_name ModuleGrid
extends Button

const module_button = preload("res://Scenes/module_button.tscn")

@export var folder:String
@export var button_name:String
var module: Module
@onready var grid_container = $GridContainer
var modules:Array[Module]
signal select_grid(grid:ModuleGrid)
# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = button_name
	var modules_used =  ResourceLoader.list_directory(folder)
	for item in modules_used:
		var _module = ResourceLoader.load(folder+item)
		modules.push_back(_module)
		var button = module_button.instantiate()
		button.module = _module
		if self.module != null and _module == self.module:
			button.focus_entered = true
		button.module_picked.connect(set_module)
		grid_container.add_child(button)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_module(module):
	self.module=module
	grid_container.visible = false
	print(self.module.name)


func _on_pressed():
	grid_container.visible = !grid_container.visible
	emit_signal("select_grid",self)
	pass # Replace with function body.
