extends Node

const MUSIC_OFFSET = 8.0
const LORE_TIME = 4.0
const TEXT = "Press Intro to join the resistance"

var time = 0.0
var music_on = false

func _ready():
	set_process(true)
	set_process_input(true)
	State.play_sample("newspaper_deployed")
	get_node("Node2D/Text").set_text(TEXT)
	if State.active_scene == null:
		State.active_scene = self

func _input(event):
	if(event.is_action_pressed("ui_accept")):
		if(music_on == false):
			State.play_song("main_theme")
		State.change_scene("res://scenes/InGame.tscn")

func _process(delta):
	time += delta
	if(time >= MUSIC_OFFSET and not music_on):
		State.play_song("main_theme")
		music_on = true
	
	if(_must_show_panel(time)):
		get_node("Node2D").show()
	else:
		get_node("Node2D").hide()
	
	
func _must_show_panel(time):
	if(time <= LORE_TIME):
		return false
	if ( int(time)%2 == 0 or time >= MUSIC_OFFSET+3.0):
		return true
	return false