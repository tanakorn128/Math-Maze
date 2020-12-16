extends KinematicBody2D
export (Script) var save_game_class
var bullet = load("res://scene/bullet1.tscn")
var inst
var velocity = Vector2()
var speed = 15000;
var global
func _ready():
	global = get_node("/root/Global")
	global.speed_player = 15000
	speed = int(global.speed_player)
	global.hp = 100
	pass

func _physics_process(delta):
	if global.player_colliding:
		speed = global.speed_player
		$HUD/TextureProgress.value = int(global.hp)
	if Input.is_action_pressed("ui_left"):
		velocity.y = 0
		velocity.x = -speed
		if speed > 0: $AnimatedSprite.play("left")
		if Input.is_action_just_pressed("ui_spacebar"): shoot("left")
	elif Input.is_action_pressed("ui_right"):
		velocity.y = 0
		velocity.x = speed
		if speed > 0: $AnimatedSprite.play("right")
		if Input.is_action_just_pressed("ui_spacebar"): shoot("right")
		
	elif Input.is_action_pressed("ui_up"):
		velocity.x = 0
		velocity.y=-speed
		if speed > 0: $AnimatedSprite.play("up")
		if Input.is_action_just_pressed("ui_spacebar"): shoot("up")
	elif Input.is_action_pressed("ui_down"):
		if speed > 0: $AnimatedSprite.play("down")
		velocity.x = 0
		velocity.y=+speed
		if Input.is_action_just_pressed("ui_spacebar"): shoot("down")
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

func shoot(value):
	inst = bullet.instance()
	inst.shoot_start(false)
	add_child(inst)
	inst.shoot2_start(value,true)
