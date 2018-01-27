extends Area2D

func _ready():
	add_to_group("radios")
	set_process(true)

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if(body.is_in_group("badguys")):
			queue_free()
