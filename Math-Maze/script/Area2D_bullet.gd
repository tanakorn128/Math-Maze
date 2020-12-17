extends Area2D
var save_game
var velocity = Vector2(450,0)
var positionY = 450
var delta2
var start = false
var shoot_area = 400
func _physics_process(delta):
	delta2 = delta
	shoot_Start(start)
	pass

func shoot_Start(value):
	if value:
		 shoot()
	else:
		pass
	pass
func shoot():
	$Sprite.rotation = 90
	position.y -= positionY * delta2
	velocity.y += gravity * delta2
	position += velocity * delta2
	rotation = velocity.angle()
	pass

