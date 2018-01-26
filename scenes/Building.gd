extends StaticBody2D

export var loyalty = 5

func _ready():
	set_process(true)
	get_node("Loyalty").set_text(str(loyalty))

func _process(delta):
	 get_node("Loyalty").set_text(str(loyalty))
