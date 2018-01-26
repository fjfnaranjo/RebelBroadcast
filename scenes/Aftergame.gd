extends Node

func _ready():
	set_process_input(true)
	var text
	var result
	
	get_node("Result").set_text(result)
	get_node("Text").set_text(texto)

func _input(event):
	if(event.is_action_pressed("reload")):
		State.change_scene("res://scenes/InGame.tscn")