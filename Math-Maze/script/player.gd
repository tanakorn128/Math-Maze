extends KinematicBody2D

var velocity = Vector2()

var Global
var speed = 13000;
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity.y = 0
		velocity.x = -speed
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
		velocity.y=+speed
		
	else:
		velocity.y=0
		velocity.x=0
		$AnimatedSprite.play("idle")
	move_and_slide(velocity*delta)
	pass
