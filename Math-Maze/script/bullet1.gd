extends Node2D
signal bullet1_queue_free
var start = true
var area_Scene
var shoot_area = 300
var shoot_right = false
var shoot_left = false
var shoot_up = false
var shoot_down = false
func _process(delta):
	skill()
	shoot_start(start)
	shoot2_start("right",shoot_right)
	shoot2_start("left",shoot_left)
	shoot2_start("up",shoot_up)
	shoot2_start("down",shoot_down)

func shoot_start(value):
	start = value
	$Area2D.start = start

func _on_Area2D_area_entered(area):
	queue_free()
	emit_signal("bullet1_queue_free")
	pass # Replace with function body.

func skill():
	$Area2D/ColorRect.color = "ff0000"

func shoot2_start(value,value2): #(up and down and left and right, start,stop)
	if value2:
		if value == "right":
			shoot_right()
			shoot_right = value2
		if value == "left":
			shoot_left()
			shoot_left = value2
		if value == "up":
			shoot_up = value2
			shoot_up()
		if value == "down":
			shoot_down = value2
			shoot_down()

func shoot_right():
	if $Area2D.position.x > shoot_area:
		queue_free()
	$Area2D.position.x += 7
	pass

func shoot_left():
	print(-shoot_area)
	print($Area2D.position.x)
	if $Area2D.position.x < -shoot_area:
		queue_free()
		pass
	$Area2D.position.x -= 7
	pass


func shoot_up():
	if $Area2D.position.y < -shoot_area:
		#queue_free()
		pass
	$Area2D.position.y -= 7
	pass

func shoot_down():
	if $Area2D.position.y > shoot_area:
		queue_free()
	$Area2D.position.y += 7
	pass
