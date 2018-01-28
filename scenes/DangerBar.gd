extends Sprite

const MAX_REGION_SIZE = 220
var INITIAL_COLOR = Color(1,1,1)
const ALERT_COLOR = Color(1,0,0)

func _ready():
	get_node("Bar").set_region_rect(Rect2(0,0,0,8))
	set_process(true)
	
func _process(delta):
	var alert_level = get_parent().get_alert_state()
	var max_alert = get_parent().get_max_alert_state()
	var normal_showed_bar = alert_level/max_alert
	
	get_node("Bar").set_region_rect(Rect2(0,0,normal_showed_bar * MAX_REGION_SIZE,8))
	var mi_color = INITIAL_COLOR.linear_interpolate(ALERT_COLOR, normal_showed_bar)
	
	get_node("Bar").set_modulate(mi_color)
	set_modulate(mi_color)