extends KinematicBody2D

export var _route = [""]
var _next_destination_idx
var _vision
var spotted_radio = null

const BASE_SPEED = 130

const SEEING_REBEL_ALERT =  10.0/60

func _ready():
	add_to_group("badguys")
	_next_destination_idx = 0
	_vision = get_node("Vision")
	set_process(true)

func _process(delta):
	if(not State.active_scene.has_node(_route[_next_destination_idx])):
		return
	var speed = BASE_SPEED + State.active_scene.alert_state / 2
	var target
	if spotted_radio and spotted_radio.get_ref():
		target = spotted_radio.get_ref()
	else:
		target = State.active_scene.get_node(_route[_next_destination_idx])
	var direction = (target.get_pos()-get_pos()).normalized()
	move(direction*delta*speed)
	get_node("Sprite").update_animation(direction, delta)
	
	var radio_spotted = false
	var rebel_spotted = false
	for area in _vision.get_overlapping_areas():
		if area.is_in_group("radios"):
			spotted_radio = weakref(area)
			break
	for body in _vision.get_overlapping_bodies():
		if body.is_in_group("rebel_guys"):
			rebel_spotted = true
			if(State.active_scene.has_method("increase_alert")):
				State.active_scene.increase_alert(SEEING_REBEL_ALERT)
			break
	if (spotted_radio and spotted_radio.get_ref()):
		if rebel_spotted:
			State.game_over()	
	

func point_reached(RP_name):
	if(RP_name == _route[_next_destination_idx]):
		_next_destination_idx = (_next_destination_idx + 1) % _route.size()
