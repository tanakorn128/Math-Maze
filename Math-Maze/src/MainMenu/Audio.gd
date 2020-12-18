extends Node2D
signal Enable
signal Disable

func _on_Back_pressed():
	get_tree().change_scene("res://src/MainMenu/Setting.tscn")
	pass # Replace with function body.


func _on_Volum_pressed():
	get_tree().change_scene("res://src/MainMenu/SoundVolum.tscn")
	pass # Replace with function body.


func _on_Enable_Sound_toggled(button_pressed):
	if(button_pressed):
		print("Hello")
	else:
		print("Goodbye")    
	pass # Replace with function body.


func _on_Enable_Sound_pressed():
	emit_signal("Disable")
	var text = get_node("Tabs/Enable Sound").text
	if (text == "Disable Sound"):
		get_node("Tabs/Enable Sound").text = "Enable Sound"
		get_node("Tabs/Volum").disabled = true
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -80)
		
	if (text == "Enable Sound"):
		emit_signal("Enable")
		get_node("Tabs/Enable Sound").text = "Disable Sound"
		get_node("Tabs/Volum").disabled = false
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 0)
		
	pass # Replace with function body.
