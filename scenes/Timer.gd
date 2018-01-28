extends Node2D

var timer

const MAX_TIME = 300
const ALMOST_OVER = 30
var ALMOST_OVER_COLOR = Color(255,0,0)
var NORMAL_COLOR = Color(255,255,255)

func _ready():
	set_process(true)
	timer = get_node("Timer")
	timer.set_wait_time( MAX_TIME )
	timer.start()

func _process(delta):
	self.show_time()
	if (timer.get_time_left() < 0.1):
		State.game_over()	

func show_time():
	timer = get_node("Timer")
	var time_left = timer.get_time_left()
	var minutes = time_left / 60
	var seconds = int(time_left) % 60
	
	var tens_minutes = int(minutes) / 10;
	var units_minutes = int(minutes) % 10;
	get_node("GraphicTimer/TensMinutes").set_region_rect(Rect2(100*tens_minutes,0,50,100))
	get_node("GraphicTimer/Minutes").set_region_rect(Rect2(100*units_minutes,0,50,100))
	var tens_seconds = int(seconds) / 10;
	var units_seconds = int(seconds) % 10;
	
	get_node("GraphicTimer/TensSeconds").set_region_rect(Rect2(100*tens_seconds,0,50,100))
	get_node("GraphicTimer/Seconds").set_region_rect(Rect2(100*units_seconds,0,50,100))
	
	if (timer.get_time_left() < ALMOST_OVER):
		get_node("GraphicTimer/TensSeconds").set_modulate(ALMOST_OVER_COLOR)
		get_node("GraphicTimer/Seconds").set_modulate(ALMOST_OVER_COLOR)
		get_node("GraphicTimer/Separator").set_modulate(ALMOST_OVER_COLOR)
		get_node("GraphicTimer/TensMinutes").set_modulate(ALMOST_OVER_COLOR)
		get_node("GraphicTimer/Minutes").set_modulate(ALMOST_OVER_COLOR)

func get_remaining_time():
	return get_node("Timer").get_time_left()
	