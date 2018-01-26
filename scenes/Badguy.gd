extends KinematicBody2D

export var _route = [""]
var current_destination

const MAX_SPEED = 50

func _ready():
	current_destination = _route[0]
	set_process(true)

func _process(delta):
	var destination_RP = State.active_scene.get_node(current_destination)
	
	var remain = move((destination_RP.get_pos()-get_pos()).normalized()*delta*MAX_SPEED)
	
