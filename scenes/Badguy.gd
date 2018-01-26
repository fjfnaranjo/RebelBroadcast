extends KinematicBody2D

export var _route = [""]
var _current_destination_idx

const MAX_SPEED = 100

func _ready():
	add_to_group("badguys")
	_current_destination_idx = 0
	set_process(true)

func _process(delta):
	var destination_RP = State.active_scene.get_node(_route[_current_destination_idx])
	var remain = move((destination_RP.get_pos()-get_pos()).normalized()*delta*MAX_SPEED)

func point_reached(RP_name):
	if(RP_name == _route[_current_destination_idx]):
		_current_destination_idx = (_current_destination_idx + 1) % _route.size()
