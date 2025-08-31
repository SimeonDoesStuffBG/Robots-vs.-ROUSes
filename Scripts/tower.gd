class_name TowerScene
extends Node2D

@export var stats: Tower
@onready var legs_pos = $Legs
@onready var body_pos = $Body
@onready var hands_pos = $Hands
@onready var head_pos = $Head
@onready var batery_pos = $Batery
@onready var mechanic_pos = $Mechanic
@onready var repair_timer = $RepairTimer

var board
var range:float
var repair_time:float
var health:int
var is_dead:
	get: return health <= 0

var charge:int
var is_active:
	get:
		return charge>0
		
signal fixing
signal fixed

func _ready():
	health = stats.health
	charge = stats.battery.charge
	repair_time = stats.battery.charge / stats.mechanic.speed
	build_tower()
	
	pass

func _process(delta):	
	
	pass

func build_tower():
	
	var head_module = stats.head.instantiate(head_pos.position)
	var body_module = stats.body.instantiate(body_pos.position)
	var hands_module = stats.hands.instantiate(hands_pos.position)
	var legs_module = stats.legs.instantiate(legs_pos.position)
	var batery_module = stats.battery.instantiate(batery_pos.position)
	var mechanic_module = stats.mechanic.instantiate(mechanic_pos.position)
	
	head_module.out_of_power.connect(recharge)
	body_module.out_of_power.connect(recharge)
	hands_module.out_of_power.connect(recharge)
	legs_module.out_of_power.connect(recharge)
	
	add_child(head_module)
	add_child(body_module)
	add_child(batery_module)
	add_child(hands_module)
	add_child(legs_module)
	add_child(mechanic_module)

func recharge():
	repair_timer.start(repair_time)
	emit_signal("fixing")
	pass

func _on_repair_timer_timeout():
	charge = stats.battery.charge * stats.mechanic.thoroughness
	emit_signal("fixed")
	pass # Replace with function body.
