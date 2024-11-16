extends TextureRect


var note := 0

func __ready():
	scale = Vector2(0.7,0.7)
	texture = Notes.notes_tex[note]
	position = -get_rect().size / 2


func _physics_process(delta):
	position.y -= Notes.n_speed
	if not Notes.scanner[note] == null and position.y < 520:
		Notes.scanner[note] = self
	
