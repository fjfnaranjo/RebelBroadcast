extends KinematicBody2D

export var _route = [""]
var _next_destination_idx
var _vision
var spotted_radio = null

const MAX_SPEED = 100

func _ready():
	add_to_group("badguys")
	_next_destination_idx = 0
	_vision = get_node("Vision")
	set_process(true)

func _process(delta):
	if(not State.active_scene.has_node(_route[_next_destination_idx])):
		return
	var target
	if spotted_radio and spotted_radio.get_ref():
		target = spotted_radio.get_ref()
	else:
		target = State.active_scene.get_node(_route[_next_destination_idx])
	move((target.get_pos()-get_pos()).normalized()*delta*MAX_SPEED)
	
	var radio_spotted = false
	var rebel_spotted = false
	for area in _vision.get_overlapping_areas():
		if area.is_in_group("radios"):
			spotted_radio = weakref(area)
			break
	for body in _vision.get_overlapping_bodies():
		if body.is_in_group("rebel_guys"):
			rebel_spotted = true
			break
	if (spotted_radio and spotted_radio.get_ref()):
		if rebel_spotted:
			State.game_over()	
	

func point_reached(RP_name):
	if(RP_name == _route[_next_destination_idx]):
		_next_destination_idx = (_next_destination_idx + 1) % _route.size()
