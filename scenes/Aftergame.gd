extends Node

const VICTORY_SENTENCES = [""]
const DEFEAT_SENTENCES = [""]

func _ready():
	set_process_input(true)
	
	var text = ""
	var result = ""
	if (State.win):
		State.play_song("victory_theme")
		result = "VICTORY!!"
		text = "Congratulations! You have liberated the Mother Land!"
	else:
		State.play_song("spotted_plus_gameover")
		result = "FAILURE!!"
		text = "You have been capture, tortured and murdered! The revolution has died!"
	
	get_node("Result").set_text(result)
	get_node("Text").set_text(text)

func _input(event):
	if(event.is_action_pressed("reload")):
		State.play_song("main_theme")
		State.change_scene("res://scenes/InGame.tscn")