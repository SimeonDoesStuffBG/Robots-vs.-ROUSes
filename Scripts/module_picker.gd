extends Control

var tower:Tower
@onready var heads = $VBoxContainer/Heads
@onready var bodies = $VBoxContainer/Bodies
@onready var hands = $VBoxContainer/Hands
@onready var legs = $VBoxContainer/Legs
@onready var batteries = $VBoxContainer/Batteries
@onready var mechanics = $VBoxContainer/Mechanics
@onready var modules = $VBoxContainer
signal tower_changed(price:int)
# Called when the node enters the scene tree for the first time.
func _ready():
	for button in modules.get_children():
		if button is ModuleGrid:
			button.select_grid.connect(select_button)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setup_tower():
	heads.set_module(tower.head)
	bodies.set_module(tower.body)
	hands.set_module(tower.hands)
	legs.set_module(tower.legs)
	batteries.set_module(tower.battery)
	mechanics.set_module(tower.mechanic)

func _on_button_pressed():
	tower.head = heads.module
	tower.body = bodies.module
	tower.hands = hands.module
	tower.legs = legs.module
	tower.battery = batteries.module
	tower.mechanic = mechanics.module
	emit_signal("tower_changed", tower.price)
	self.visible = false
	pass # Replace with function body.

func select_button(module_grid:ModuleGrid):
	for button in modules.get_children():
		if button is ModuleGrid and button != module_grid:
			button.grid_container.visible = false
