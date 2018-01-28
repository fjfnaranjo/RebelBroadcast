extends Sprite

var proyected_direction = Vector2(0,1)
var time = 0
var direction_frame = 2

const DOWN = Vector2(0, 1)
const UP = Vector2(0, -1)
const LEFT = Vector2(-1, 0)
const RIGHT = Vector2(1, 0)

const WIDTH = 64
const HEIGHT = 64

const TIME_BETWEEN_FRAMES = 0.1

func update_animation(direction, delta):
	var new_proyected_direction = Vector2(round(direction.x), round(direction.y))
	if (direction == Vector2(0,0)):
		time = 0
	else:
		if new_proyected_direction == proyected_direction:
			time += delta
		else:
			time = 0
			proyected_direction = new_proyected_direction
		
		if proyected_direction == UP:
			direction_frame = 0
		elif proyected_direction == LEFT:
			direction_frame = 1
		elif proyected_direction == DOWN:
			direction_frame = 2
		elif proyected_direction == RIGHT:
			direction_frame = 3
	var frame = int(time / TIME_BETWEEN_FRAMES)
	set_region_rect(Rect2(frame*WIDTH, direction_frame*HEIGHT, WIDTH, HEIGHT))
