extends Area2D


func _ready():
	add_to_group("radio_hideouts")
	set_process(true)

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if (body.is_in_group("rebel_guys") && body.has_method("obtain_radio")):
			body.obtain_radio()
