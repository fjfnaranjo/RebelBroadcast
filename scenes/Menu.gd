extends Node

func _ready():
	set_process_input(true)
	State.play_sample("newspaper_deployed")
	if State.active_scene == null:
		State.active_scene = self

func _input(event):
	if(event.is_action_pressed("ui_accept")):
		State.change_scene("res://scenes/InGame.tscn")