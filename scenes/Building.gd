extends StaticBody2D

export var loyalty = 5

func _ready():
	set_process(true)
	add_to_group("buildings")
	get_node("Loyalty").set_text(str(loyalty))

func _process(delta):
	if(loyalty == 0):
		get_node("Loyalty").set_text(":)")
	else:
		get_node("Loyalty").set_text(str(loyalty))

func hurt():
	if (loyalty > 0):
		loyalty -= 1

