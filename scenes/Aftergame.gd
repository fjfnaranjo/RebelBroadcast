extends Node

const VICTORY_SENTENCES = ["There are people  in the streets asking for the resignation of the Dictator. The Revolution begins now"]
const DEFEAT_SENTENCES = [""]

func _ready():
	set_process_input(true)
	
	var text = ""
	var result = ""
	var score = ""
	
	if (State.win):
		State.play_song("victory_theme")
		result = "   VICTORY!"
		text = "There are people  in the streets asking for the resignation of the Dictator. The Revolution begins now"
		
		score = "[center]Converted buildings:\t" + str(State.get_score_point())
		score += "\nRemaining time:\t" + str(State.get_remaining_time())
		score += "\n[b]Total Score:\t" + str(State.get_remaining_time() + State.get_score_point()) + "[/b][/center]"
		
	else:
		get_node("DefeatSprite").show()
		State.play_song("spotted_plus_gameover")
		result = "    DEFEAT!"
		text = "You are in the hands of the Political Police. The Revolution is over before it started.."
	
		score = "[center]Converted buildings:\t" + str(State.get_score_point())
		score += "\nRemaining time:\t 0"
		score += "\n[b]Total Score:\t" + str(State.get_remaining_time() + State.get_score_point()) + "[/b][/center]"
	
	get_node("Result").get_node("Text").set_text(result)
	get_node("Text").get_node("Text").set_text(text)
	get_node("Score").get_node("Text").set_bbcode(score)

func _input(event):
	if(event.is_action_pressed("reload")):
		State.play_song("main_theme")
		State.change_scene("res://scenes/InGame.tscn")