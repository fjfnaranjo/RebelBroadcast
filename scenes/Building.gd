extends StaticBody2D

var loyalty_node
var loyalty #int

func _ready():
	set_process(true)
	loyalty_node = get_node("Loyalty")
	loyalty = int (loyalty_node.get_text())

func _set_process(delta):
	if(str(loyalty) != loyalty_node.get_text()):
		loyalty -= 1;
