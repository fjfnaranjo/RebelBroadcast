extends Node

var newspaper_sound = false

func _ready():
	set_process_input(true)
	if State.active_scene == null:
		State.active_scene = self

func _input(event):
	if(event.is_action_pressed("ui_accept")):
		State.change_scene("res://scenes/InGame.tscn")

func _process(delta):
	if(not newspaper_sound):
		State.play_sample("newspaper_deployed")
		newspaper_sound = true