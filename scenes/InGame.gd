extends Node

var victory_points = 0
var alert_state = 0.0

const ALERT_RELAXATION = 0.3 / 60
const MAX_ALERT = 100

func _ready():
	set_process(true)

func _process(delta):
	if alert_state > 0:
		alert_state -= ALERT_RELAXATION
	if(get_node("Perspective/RebelGuy").has_radio):
		get_node("Interface/RadioIcon").show()
	else:
		get_node("Interface/RadioIcon").hide()
	if(victory_points <= 0):
		State.win = true
		State.you_win_mf()

func add_victory_points():
	victory_points += 1

func reduce_victory_points(): 
	victory_points -= 1

func increase_alert(points):
	if(alert_state <= MAX_ALERT):
		alert_state += points

func get_alert_state():
	return alert_state

func get_max_alert_state():
	return MAX_ALERT


