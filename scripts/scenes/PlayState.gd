extends Node2D


@onready var voices = $voices
@onready var inst = $inst

var notes_spawned := {}

func _ready():
	Notes.l_load_chart("fresh")
	
	Notes.note_spawn_node = $UI/GUI/spawned_notes

	voices.stream = Notes.voices
	voices.play()
	inst.stream = Notes.inst
	inst.play()


func _physics_process(delta):
	if inst.playing:
		for note in Notes.chart.keys():
			if float(note) <= inst.position*1000 and not notes_spawned.has(note):
				Notes.spawn_note(Notes.chart[note][0])
				notes_spawned[note] = 0
