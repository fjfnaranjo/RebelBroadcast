extends RichTextLabel

const messages = ["[b]ATTENTION:[/b] The revolution is near, it is time to stand up to your opressors and reclaim your land!"]

func _ready():
	pass

func new_broadcast():
	set_text(messages[0])
