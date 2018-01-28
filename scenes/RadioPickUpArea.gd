extends Area2D

const MAX_COOLDOWN = 1.0
var cooldown
var radio_available = true

func _ready():
	add_to_group("radio_hideouts")
	cooldown = MAX_COOLDOWN
	set_process(true)

func _process(delta):
	if not radio_available:
		cooldown -= delta
		if cooldown <= 0:
			radio_available = true
			cooldown = MAX_COOLDOWN
	else:
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if (body.is_in_group("rebel_guys") && body.has_method("obtain_radio")):
				body.obtain_radio()
				radio_available = false
