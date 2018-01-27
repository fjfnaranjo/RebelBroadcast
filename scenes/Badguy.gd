extends KinematicBody2D

export var _route = [""]
var _current_destination_idx
var _vision

const MAX_SPEED = 100

func _ready():
	add_to_group("badguys")
	_current_destination_idx = 0
	_vision = get_node("Vision")
	set_process(true)

func _process(delta):
	if(not State.active_scene.has_node(_route[_current_destination_idx])):
		return
	var destination_RP = State.active_scene.get_node(_route[_current_destination_idx])
	var remain = move((destination_RP.get_pos()-get_pos()).normalized()*delta*MAX_SPEED)
	
	var radio_spotted = false
	var rebel_spotted = false
	for area in _vision.get_overlapping_areas():
		if area.is_in_group("radios"):
			radio_spotted = true
			break
	for body in _vision.get_overlapping_bodies():
		if body.is_in_group("rebel_guys"):
			rebel_spotted = true
			break
	if (radio_spotted and rebel_spotted):
		State.game_over()

func point_reached(RP_name):
	if(RP_name == _route[_current_destination_idx]):
		_current_destination_idx = (_current_destination_idx + 1) % _route.size()
