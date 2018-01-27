extends Node

var victory_points = 0
var alert_state = 0.0

const MAX_ALERT = 100

func _ready():
	set_process(true)

func _process(delta):
	if(get_node("RebelGuy").has_radio):
		get_node("RadioIcon").set_texture(load("res://resources/images/radio-icon.png"))
	else:
		get_node("RadioIcon").set_texture(load("res://resources/images/no-radio-icon.png"))
	if(victory_points <= 0):
		State.win = true
		State.you_win_mf()

func add_victory_points():
	victory_points += 1

func reduce_victory_points(): 
	victory_points -= 1

func increase_alert(points):
	alert_state += points
	if(alert_state >= MAX_ALERT):
		State.game_over()



