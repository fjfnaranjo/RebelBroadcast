extends Node

const VICTORY_SENTENCES = ["There are people  in the streets asking for the resignation of the Dictator. The Revolution begins now"]
const DEFEAT_SENTENCES = [""]

func _ready():
	set_process_input(true)
	
	var text = ""
	var result = ""
	if (State.win):
		State.play_song("victory_theme")
		result = "VICTORY!"
		text = "There are people  in the streets asking for the resignation of the Dictator. The Revolution begins now"
	else:
		State.play_song("spotted_plus_gameover")
		result = "DEFEAT!"
		text = "You are in the hands of the Political Police. The Revolution is over before it started.."
	
	get_node("Result").set_text(result)
	get_node("Text").set_text(text)

func _input(event):
	if(event.is_action_pressed("reload")):
		State.play_song("main_theme")
		State.change_scene("res://scenes/InGame.tscn")