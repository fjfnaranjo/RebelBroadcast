extends KinematicBody2D

export var _route = [""]

const base_diff = 24

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
	set_z(get_pos().y+base_diff)

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
	get_node("Vision").set_rot(direction.angle() + PI)
	get_node("Sprite").update_animation(direction, delta)

	set_z(get_pos().y+base_diff)
	
	var radio_spotted = false
	var rebel_spotted = false
	for area in _vision.get_overlapping_areas():
		if area.is_in_group("radios"):
			spot_radio(area)
			break
	for body in _vision.get_overlapping_bodies():
		if body.is_in_group("rebel_guys"):
			rebel_spotted = true
			if(State.active_scene.has_method("increase_alert")):
				State.active_scene.increase_alert(SEEING_REBEL_ALERT)
			if(State.active_scene.has_method("get_alert_state") and State.active_scene.alert_state >= State.active_scene.MAX_ALERT):
				State.game_over()
			break
	for wave in get_tree().get_nodes_in_group("waves"):
		var things = wave.get_overlapping_bodies()
		for thing in things:
			if(thing == self ):
				spot_radio(wave.get_parent())
	if (spotted_radio and spotted_radio.get_ref()):
		if rebel_spotted:
			State.game_over()	
	

func point_reached(RP_name):
	if(RP_name == _route[_next_destination_idx]):
		_next_destination_idx = (_next_destination_idx + 1) % _route.size()

func spot_radio(radio):
	spotted_radio = weakref(radio)