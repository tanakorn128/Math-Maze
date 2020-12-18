extends TextureProgress



func _on_Timer_timeout():
	self.value -= 1
	if self.value == 0:
		get_tree().change_scene("res://src/Chapter/Ch1/Ch1-1/ch1.tscn")
	pass # Replace with function body.
