extends Node2D

signal attack_enemy
func _ready():
	#
	pass

func bullet2_delete():
	emit_signal("attack_enemy")

func shoot():
	var shoot = load("res://scene/bullet2.tscn")
	var inst = shoot.instance()
	inst.connect("bullet2_queue_free",self,"bullet2_delete")
	add_child(inst)
	pass


