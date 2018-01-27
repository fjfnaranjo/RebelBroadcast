extends KinematicBody2D

export var speed = Vector2(0,0)

export var has_radio = false

const _UI_UP = "ui_up"
const _UI_DOWN = "ui_down"  
const _UI_RIGHT = "ui_right"
const _UI_LEFT = "ui_left"
const _EXIT = "exit"

const MAX_SPEED = 100

func _ready():
	add_to_group("rebel_guys")
	set_process(true)
	set_process_input(true)

func _process(delta):
	_check_controls()
	_check_collisions()

	move( speed*delta )
	get_node("Sprite").update_animation(speed.normalized(), delta)

func _check_controls():
	if(Input.is_action_pressed(_UI_UP)):
		speed.y = -MAX_SPEED
	elif(Input.is_action_pressed(_UI_DOWN)):
		speed.y = MAX_SPEED
	else:
		speed.y = 0
	if(Input.is_action_pressed(_UI_LEFT)):
		speed.x = -MAX_SPEED
	elif(Input.is_action_pressed(_UI_RIGHT)):
		speed.x = MAX_SPEED
	else:
		speed.x = 0
	
	if(Input.is_action_pressed("place_radio") && has_radio):
		_place_radio()

func _place_radio():
	var radio_instance = load("res://scenes/Radio.tscn").instance()
	get_parent().add_child(radio_instance)
	radio_instance.set_pos(get_pos())
	has_radio = false
	
	var player = get_tree().get_root().get_node("Game").get_node("SamplePlayer2D")
	player.play("radio_on")

func obtain_radio():
	has_radio = true
	
	
func _check_collisions():

	var broadcast_recived = false	
	for wave in get_tree().get_nodes_in_group("waves"):
		var things = wave.get_overlapping_bodies()
		for thing in things:
			if(thing.is_in_group("rebel_guys") ):
				broadcast_recived = true
	
	if(not State.active_scene.has_node("BroadcastMessage")):
		return
	var broadcasting_message = State.active_scene.get_node("BroadcastMessage")
	if (broadcast_recived):
		broadcasting_message.show_message()
	else:
		broadcasting_message.hide_message()
	
	
	