extends StaticBody2D

export var base_diff = 30

func _ready():
	set_z_index(get_position().y+base_diff)