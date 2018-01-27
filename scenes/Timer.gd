extends RichTextLabel

var timer

const MAX_TIME = 120
const ALMOST_OVER = 30
var ALMOST_OVER_COLOR = 'red'
var NORMAL_COLOR ='white'

func _ready():
	set_process(true)
	timer = get_node("Timer")
	timer.set_wait_time( MAX_TIME )
	timer.start()

func _process(delta):
    update()

func update():
	timer = get_node("Timer")
	var time_left = timer.get_time_left()
	var minutes = time_left / 60
	var seconds = int(time_left) % 60
	var color = ALMOST_OVER_COLOR if (timer.get_time_left() < ALMOST_OVER) else NORMAL_COLOR
	var str_elapsed = "[color=%s]%02d : %02d[/color]" % [color, minutes, seconds]
	if (timer.get_time_left() < 0.1):
		State.game_over()	
	self.set_bbcode(str_elapsed)
