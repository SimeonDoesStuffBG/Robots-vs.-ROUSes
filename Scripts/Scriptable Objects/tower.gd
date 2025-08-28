class_name Tower
extends Resource

@export var head:Module
@export var battery:Batery
@export var legs:Module
@export var body:Module
@export var mechanic:Mechanic

var health:
	get:
		var total_health = head.health
		total_health+=battery.health
		total_health+=legs.health
		total_health+=body.health
		total_health+=mechanic.health
		return total_health
var cooldown:
	get:
		var total_cooldown = head.cooldown
		total_cooldown += battery.cooldown
		total_cooldown += legs.cooldown
		total_cooldown += body.cooldown
		total_cooldown += mechanic.cooldown
		return total_cooldown
var price:
	get:
		var total_price = head.price
		total_price += battery.price
		total_price += legs.price
		total_price += body.price
		total_price += mechanic.price
		return total_price
