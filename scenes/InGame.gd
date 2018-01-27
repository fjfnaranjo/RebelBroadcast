extends Node

var victory_points = 0

func _ready():
	set_process(true)

func _process(delta):
	if(victory_points <= 0):
		State.win = true
		State.you_win_mf()

func add_victory_points():
	victory_points += 1

func reduce_victory_points(): 
	victory_points -= 1



