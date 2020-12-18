extends KinematicBody2D
signal Test
var velocity = Vector2()

var Global
var speed;
func _physics_process(delta):
	Global = get_node("/root/Global")
	speed = Global.speed
	if Input.is_action_pressed("ui_left"):
		velocity.y = 0
		velocity.x = -speed
		emit_signal("Test")
		if speed > 0: $AnimatedSprite.play("left")
	elif Input.is_action_pressed("ui_right"):
		velocity.y = 0
		velocity.x = speed
		if speed > 0: $AnimatedSprite.play("right")
	elif Input.is_action_pressed("ui_up"):
		velocity.x = 0
		velocity.y=-speed
		if speed > 0: $AnimatedSprite.play("up")
	elif Input.is_action_pressed("ui_down"):
		if speed > 0: $AnimatedSprite.play("down")
		velocity.x = 0
		velocity.y=speed
		
	else:
		velocity.y=0
		velocity.x=0
		$AnimatedSprite.play("idle")
	move_and_slide(velocity*delta)
	pass

func _on_Area2D_body_entered(body):

	pass # Replace with function body.




func _on_Area2D_body_exited(body):

	pass # Replace with function body.
