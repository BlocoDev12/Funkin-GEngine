extends AnimatedSprite2D


@export_range(0,3) var arrow := 0

func _ready():
	Notes.arrows_pos[arrow] = position

func _input(event):
	if Input.is_action_just_pressed(str(arrow)):
		if Notes.scanner[arrow] != null:
			_on_press_note(Notes.scanner[arrow])
		else:
			play_backwards("press"+str(arrow))
	if Input.is_action_just_released(str(arrow)):
		play("idle"+str(arrow))

func _on_press_note(note):
	pass
	
