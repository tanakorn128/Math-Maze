extends KinematicBody2D
export (Script) var save_game_class

var velocity = Vector2()
var speed = 9000;
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
func save():
	var new_save = save_game_class.new()
	new_save.player_pos = position
	ResourceSaver.save("res://saves/save_01.tres", new_save)
	pass


func _on_Timer_timeout():
	save()
	pass # Replace with function body.
