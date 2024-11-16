extends AudioStreamPlayer


signal _on_beat(beat)

var position := 0.0
var cur_beat := 0
var s_p_b_pas := 0

var sec_per_beat := 60/120

func _physics_process(delta):
	if playing:
		position = get_playback_position() + AudioServer.get_time_since_last_mix()
		position -= AudioServer.get_output_latency()
		cur_beat = int(floor(position/sec_per_beat))
		
		if cur_beat != s_p_b_pas:
			s_p_b_pas = cur_beat
			emit_signal("_on_beat",cur_beat)
