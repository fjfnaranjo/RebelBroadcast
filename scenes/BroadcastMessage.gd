extends RichTextLabel

const MAX_EXPOSED_SECONDS = 6

var broadcasting

var remaining_exposed_seconds = MAX_EXPOSED_SECONDS

const MESSAGES = ["The revolution is near, it is time to stand up to your opressors and reclaim your land!",
"They will not convince us because convincing means persuading. And to persuade they need something that they lack in this struggle, reason and right. It seems useless to ask them to think about the nation.",
"(...) They considered us an impotent and submissive herd and they are beginning to be frightened of that herd, a giant flock in which the 'Dictator' warns its gravediggers. (...)",
"(...) There will be a blood bath; we will not shun it; there will be someone who has to die: we will kill him because it is necessary; there will be a lot of destruction; we will do it to free the world from its tyrannical institutions. (...)",
"(...) If I say that this or that thing that I do not like I am protesting. If I worry also because what I do not like does not happen again, I'm resisting. (...)",
"(...) The 'Regime' demands that you renounce your interests, your aspirations, your ideals; in a word: servile subordination to civil peace. (...)"
]

var current_message

func _ready():
	new_broadcast()
	set_process(true)
	broadcasting = false
	
func _process(delta):
	remaining_exposed_seconds -= delta
	if (remaining_exposed_seconds < 0):
		new_broadcast()

func new_broadcast():
	remaining_exposed_seconds = MAX_EXPOSED_SECONDS	
	var num_messages = MESSAGES.size()
	randomize()
	var num_rand_message = randi()%num_messages;
	current_message = MESSAGES[num_rand_message]

func show_message():
	set_text(current_message)
	if(not broadcasting):
		broadcasting = true
		State.play_sample("radio_on") # radio_broadcast

func hide_message():
	set_text('')
	broadcasting = false