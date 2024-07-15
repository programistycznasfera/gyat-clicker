extends Sprite
onready var label = $"../Label"


var cash = 0
var perclick = 1 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	cash += perclick
	label.text = cash
	
