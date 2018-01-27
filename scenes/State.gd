extends Node

var level = 1
var score = 0
var alert_state = 0
var win = false
var active_scene

func add_score_point():
	score+=1

func game_over():
	change_scene("res://scenes/Aftergame.tscn")

func you_win_mf():
	change_scene("res://scenes/Aftergame.tscn")

func change_scene(scene_path):
	var scene_instance = load(scene_path).instance()
	if active_scene != null:
		active_scene.queue_free()
	active_scene = scene_instance
	get_tree().get_root().get_node("Game").add_child(scene_instance)
