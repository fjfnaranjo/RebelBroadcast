extends Node

var MUSIC_OFFSET = 3.0
var time = 0.0
var music_on = false

func _ready():
	set_process(true)
	set_process_input(true)
	State.play_sample("newspaper_deployed")
	if State.active_scene == null:
		State.active_scene = self

func _input(event):
	if(event.is_action_pressed("ui_accept")):
		State.change_scene("res://scenes/InGame.tscn")

func _process(delta):
	time += delta
	if(time >= MUSIC_OFFSET and not music_on):
		State.play_song("main_theme")
		music_on = true