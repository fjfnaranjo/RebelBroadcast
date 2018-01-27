extends Area2D

export var radius = 100

func _ready():
	set_process(true)
	var sprite_radius = get_node("Sprite").get_texture().get_width() / 2.0
	get_parent().set_scale(Vector2(radius,radius)/sprite_radius)
	