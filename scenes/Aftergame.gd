extends Node

func _ready():
	set_process_input(true)
	
	var text = ""
	var result = ""
	if (State.win):
		result = "VICTORY!!"
		text = "Congratulations! You have liberated the Mother Land!"
	else:
		State.play_sample("spotted_plus_gameover")
		result = "FAILURE!!"
		text = "You have been capture, tortured and murdered! The revolution has died!"
	
	get_node("Result").set_text(result)
	get_node("Text").set_text(text)

func _input(event):
	if(event.is_action_pressed("reload")):
		State.change_scene("res://scenes/InGame.tscn")