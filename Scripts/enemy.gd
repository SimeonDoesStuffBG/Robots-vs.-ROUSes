extends Node2D

@onready var timer = $Timer
@onready var tower_detector = $RayCast2D
var currency_pack = preload("res://Scenes/currency_pack.tscn")
@export var stats:Enemy
var health
var speed:
	get:
		return stats.speed

var damage:
	get:
		return stats.damage
var moving = true

var target:Node2D
@onready var animated_sprite_2d = $AnimatedSprite2D

var attacking:
	set(value):
		moving = !value
	get:
		return !moving
var is_dead:
	get: return health<=0
# Called when the node enters the scene tree for the first time.
func _ready():
	health = stats.health
	animated_sprite_2d.sprite_frames = stats.animation
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving:
		animated_sprite_2d.play("Walk")
		self.translate(Vector2.LEFT * speed * delta)
		
	if tower_detector.is_colliding():
		if not attacking:
			target = tower_detector.get_collider().get_parent()
			attacking = true
			animated_sprite_2d.play("Attack")
			timer.start(.1)
	else:
		attacking = false
	pass

func attack():
	if target != null:
		target.health -= damage
		if target.is_dead:
			target.queue_free()
			target = null
		else:
			timer.start(0.75)

func take_damage(damage):
	self.health -= damage
	if self.is_dead:
		die()

func die():
	var bolts = currency_pack.instantiate()
	bolts.position = position
	bolts.game_manager = get_parent().game_manager
	self.get_parent().add_child(bolts)
	Global.rouses_killed+=1
	self.queue_free()

func _on_area_2d_body_entered(body):
	take_damage(body.damage)
	body.queue_free()
	pass # Replace with function body.


func _on_timer_timeout():
	attack()
	pass # Replace with function body.
