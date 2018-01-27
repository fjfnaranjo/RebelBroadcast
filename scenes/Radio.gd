extends Area2D

const FINDING_RADIO_ALERT = 3

func _ready():
	add_to_group("radios")
	set_process(true)
	var message_instance = load("res://scenes/BroadcastMessage.tscn").instance()
	get_parent().add_child(message_instance)
	message_instance.set_pos(get_pos())
	message_instance.new_broadcast()

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if(body.is_in_group("badguys")):
			State.play_sample("radio_destruction")
			if(State.active_scene.has_method("increase_alert")):
				State.active_scene.increase_alert(FINDING_RADIO_ALERT)
			queue_free()
