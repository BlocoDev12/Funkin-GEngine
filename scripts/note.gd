extends TextureRect


var note := 0

func _ready():
	texture = Notes.notes_tex[note]
	position = -get_rect().size / 2


func _physics_process(delta):
	position.y -= Notes.speed
	
