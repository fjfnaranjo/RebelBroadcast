extends Area2D

const FINDING_RADIO_ALERT = 5

func _ready():
	add_to_group("radios")
	set_process(true)
	var message_instance = State.active_scene.get_node("Interface/BroadcastMessage")
	message_instance.new_broadcast()

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if(body.is_in_group("badguys")):
			get_node("RadioDestruction").play()
			if(State.active_scene.has_method("increase_alert")):
				State.active_scene.increase_alert(FINDING_RADIO_ALERT)
			queue_free()
