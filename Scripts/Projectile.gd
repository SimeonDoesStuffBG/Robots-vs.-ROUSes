extends CharacterBody2D

@export var stats:Projectile
var speed
var damage
@onready var splash_damage_area = $Splash_Damage_Area/CollisionShape2D
var splash_damage_items:Array[Node2D]
# Called when the node enters the scene tree for the first time.
func _ready():
	self.speed = stats.speed
	self.damage = stats.damage
	if stats.is_explosive:
		splash_damage_area.shape.radius = stats.explosive_radius * Global.tile_space
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.translate(Vector2.RIGHT * speed * delta)
	pass

func handle_explosive():
	if stats.is_explosive:
		for item in splash_damage_items:
			item.take_damage(damage / 2)

func _on_splash_damage_area_area_entered(area):
	splash_damage_items.push_back(area.get_parent())
	print(splash_damage_items)
	pass # Replace with function body.


func _on_splash_damage_area_area_exited(area):
	splash_damage_items.erase(area.get_parent())
	print(splash_damage_items)
	pass # Replace with function body.
