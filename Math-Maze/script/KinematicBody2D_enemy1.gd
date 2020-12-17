extends KinematicBody2D

func _ready():
	$HUD/ColorRect.hide()
	
func _process(delta):
	#print($RayCast2D.get_collider_shape())
	pass


