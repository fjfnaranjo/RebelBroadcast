extends Area2D

func _ready():
	set_process(true)

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if (body.is_in_group("badguys") && body.has_method("point_reached")):
			body.point_reached(get_parent().get_name()+"/"+get_name())
