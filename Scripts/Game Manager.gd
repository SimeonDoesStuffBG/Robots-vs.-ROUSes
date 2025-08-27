extends Node

var currency = 128
@onready var money_label = $Interface/MoneyLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	money_label.text = str(currency)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_money(amount, add=true):
	if add:
		currency+=amount
	else:
		currency-=amount
	money_label.text = str(currency)
