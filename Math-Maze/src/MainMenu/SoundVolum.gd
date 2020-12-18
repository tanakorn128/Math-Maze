extends Node2D
	
func _process(delta):
	_Update_Value(get_node("Control/HSlider").value)
	pass

func _Update_Value(value):
	get_node("Control/Label").text = str(value+100)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	if (int(value) == -80):
		get_node("Control/Label").text = str(0)
		
	pass

