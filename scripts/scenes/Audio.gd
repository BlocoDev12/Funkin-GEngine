extends Node2D


func play(stream, bus := "Master", volume := 0.0, n_name := ""):
	var s := AudioStreamPlayer.new()
	s.stream = stream
	s.volume_db = volume
	s.bus = bus
	s.name = n_name
	add_child(s)
	s.play()
	print(stream)

func stop(n_name):
	find_child(n_name).stop()
