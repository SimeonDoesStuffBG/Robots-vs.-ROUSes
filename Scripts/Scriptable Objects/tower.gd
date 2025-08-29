class_name Tower
extends Resource

@export var head:WorkingModule
@export var battery:Batery
@export var legs:WorkingModule
@export var body:WorkingModule
@export var hands:WorkingModule
@export var mechanic:Mechanic
const tower = preload("res://Scenes/tower.tscn")

var health:
	get:
		var total_health = head.health
		total_health+=battery.health
		total_health+=legs.health
		total_health+=body.health
		total_health+=hands.health
		total_health+=mechanic.health
		return total_health

var cooldown:
	get:
		var total_cooldown = head.cooldown
		total_cooldown += battery.cooldown
		total_cooldown += legs.cooldown
		total_cooldown += body.cooldown
		total_cooldown += hands.cooldown
		total_cooldown += mechanic.cooldown
		return total_cooldown

var price:
	get:
		var total_price = head.price
		total_price += battery.price
		total_price += legs.price
		total_price += body.price
		total_price += hands.price
		total_price += mechanic.price
		return total_price

func instantiate(position:Vector2):
	var tower_instance = tower.instantiate()
	tower_instance.stats = self
	tower_instance.position = position
	return tower_instance
