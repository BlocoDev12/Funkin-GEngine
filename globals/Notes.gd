extends Node


var scanner := [
	null,
	null,
	null,
	null
]

var notes_tex := [
	preload("res://assets/images/notes/purple instance 0000.png"),
	preload("res://assets/images/notes/blue instance 0000.png"),
	preload("res://assets/images/notes/green instance 0000.png"),
	preload("res://assets/images/notes/red instance 0000.png")
]

var arrows_pos := [
	0,
	0,
	0,
	0
]

var pool := []
var usable_pool := []

var chart := {}

var bpm := 0.0
var c_speed := 0.0
var n_speed := 0.0

var voices = null
var inst = null

func l_load_chart(song : String):
	var file := FileAccess.open("res://assets/data/songs/"+song+"/"+song+"-hard.json",FileAccess.READ)
	var chart_ = JSON.parse_string(file.get_as_text()) as Dictionary
	
	voices = load("res://assets/songs/"+chart_["song"]["song"].to_lower()+"/Voices.ogg")
	inst = load("res://assets/songs/"+chart_["song"]["song"].to_lower()+"/Inst.ogg")
	
	c_speed = chart_["song"]["speed"]
	bpm = chart_["song"]["bpm"]
	n_speed = ((720 + 77)-Notes.arrows_pos[0].y)/((4*60.0)/(140*(c_speed)))
	
	for sec in chart_["song"]["notes"]:
		var note_pl := 0.0001
		for note in sec["sectionNotes"]:
			if sec["mustHitSection"] == true and note.size() < 4:
				if chart.has(note[0]):
					chart[str(note[0]+note_pl)] = [note[1],note[2]]
					note_pl += 0.0001
				else:
					chart[str(note[0])] = [note[1],note[2]]
			else:
				if note[0] > 3:
					if chart.has(note[0]):
						chart[str(note[0]+note_pl)] = [note[1]+4,note[2]]
						note_pl += 0.0001
					else:
						chart[str(note[0])] = [note[1]+4,note[2]]
				else:
					if chart.has(note[0]):
						chart[str(note[0]+note_pl)] = [note[1]-4,note[2]]
						note_pl += 0.0001
					else:
						chart[str(note[0])] = [note[1]-4,note[2]]
	print(chart)

var note_m := preload("res://prefabs/note.tscn")
var note_spawn_node = null
func spawn_note(note : int):
	if note < 4:
		var note_n := note_m.instantiate()
		note_spawn_node.add_child(note_n)
		note_n.note = note
		note_n.__ready()
		note_n.position = Vector2(Notes.arrows_pos[note].x,(720 + 77))
	
func del_note(note : TextureRect):
	pass

