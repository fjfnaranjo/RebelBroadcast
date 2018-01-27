extends Area2D

const SECONDS = 1

export var radius = 100
var countdown


func _ready():
	set_process(true)
	countdown = SECONDS
	
	add_to_group("waves")
	var sprite_radius = get_node("Sprite").get_texture().get_width() / 2.0
	get_parent().set_scale(Vector2(radius,radius)/sprite_radius)
	
func _process(delta):
	countdown -= delta
	if (countdown <= 0):
		countdown = SECONDS
		_check_collisions()
	
func _check_collisions():
	var things = get_overlapping_bodies()
	for thing in things:
		if(thing.is_in_group("buildings") and thing.has_method("hurt")):
			thing.hurt()
		elif(thing.is_in_group("rebel_guys") and thing.has_method("hurt")):
			pass