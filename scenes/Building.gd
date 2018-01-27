extends StaticBody2D

export var loyalty = 5
var still_loyal = true

var broadcasting = false

func _ready():
	set_process(true)
	add_to_group("buildings")
	get_node("Loyalty").set_text(str(loyalty))
	State.active_scene.add_victory_points()

func _process(delta):
	pass

func hurt():
	if (loyalty > 0):
		loyalty -= 1
		get_node("Loyalty").set_text(str(loyalty))
		
	elif(still_loyal):
		get_node("Loyalty").set_text(":)")
		State.play_sample("building_converted") 
		State.active_scene.reduce_victory_points()
		still_loyal = false
