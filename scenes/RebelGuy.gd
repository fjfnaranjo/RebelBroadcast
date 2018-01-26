extends KinematicBody2D

export var speed = Vector2(0,0)

const _UI_UP = "ui_up"
const _UI_DOWN = "ui_down"  
const _UI_RIGHT = "ui_right"
const _UI_LEFT = "ui_left"
const _EXIT = "exit"

const MAX_SPEED = 100

func _ready():
	set_process(true)
	set_process_input(true)
	pass

func _process(delta):
	if(Input.is_action_pressed(_UI_UP)):
		speed = Vector2(0,-MAX_SPEED)
	elif(Input.is_action_pressed(_UI_LEFT)):
		speed = Vector2(-MAX_SPEED,0)
	elif(Input.is_action_pressed(_UI_RIGHT)):
		speed = Vector2(MAX_SPEED,0)
	elif(Input.is_action_pressed(_UI_DOWN)):
		speed = Vector2(0,MAX_SPEED)
	else:
		speed = Vector2(0,0)

	self.move( speed*delta )
