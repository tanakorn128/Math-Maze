extends KinematicBody2D
var velocity = Vector2(350,0)
var gravity = 9.8
func _physics_process(delta):
	velocity.y += gravity * (delta*delta)
	position += velocity * delta
	#rotation = velocity.angle()
	pass
