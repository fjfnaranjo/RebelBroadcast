extends RichTextLabel

var timer

const MAX_TIME = 100

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
	var str_elapsed = "%02d : %02d" % [minutes, seconds]
	self.set_text(str_elapsed)

