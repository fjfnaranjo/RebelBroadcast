extends Sprite

const MAX_REGION_SIZE = 220

func _ready():
	self.set_region_rect(Rect2(0,0,0,8))
	set_process(true)
	
func _process(delta):
	var alert_level = get_parent().get_alert_state()
	var max_alert = get_parent().get_max_alert_state()
	var showed_bar = alert_level/max_alert * MAX_REGION_SIZE
	#print(str(alert_level) + " "+str(max_alert))
	self.set_region_rect(Rect2(0,0,showed_bar,8))