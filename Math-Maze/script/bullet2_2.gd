extends Node2D
signal bullet2_queue_free


func _on_Area_area_entered(area):
	queue_free()
	emit_signal("bullet2_queue_free")
	pass # Replace with function body.


