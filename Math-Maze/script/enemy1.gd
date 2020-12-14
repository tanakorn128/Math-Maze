extends Node2D
func _process(delta):
	if $Navigation2D/KinematicBody2D/RayCast2D.is_colliding():
		#queue_free()
		
		pass
