extends KinematicBody2D

export var speed = Vector2(0,0)

var has_radio

const _UI_UP = "ui_up"
const _UI_DOWN = "ui_down"  
const _UI_RIGHT = "ui_right"
const _UI_LEFT = "ui_left"
const _EXIT = "exit"

const MAX_SPEED = 100

func _ready():
	set_process(true)
	set_process_input(true)
	has_radio = false

func _process(delta):
	_check_controls()

	self.move( speed*delta )

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