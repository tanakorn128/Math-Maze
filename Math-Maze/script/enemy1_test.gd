extends Node2D
var shoot = load("res://scene/bullet1.tscn")
var inst = shoot.instance()
func _ready():
	$battle/BackGround.show()
	

func _on_Timer_timeout():
	
	$battle/BackGround/bullet1.shoot()
	print("shoot")
	pass # Replace with function body.
