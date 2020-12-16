extends Node2D

signal attack_enemy
func _ready():
	#
	pass

func bullet1_delete():
	print("bullet1_deletes")
	emit_signal("attack_enemy")

func shoot():
	var shoot = load("res://scene/bullet1.tscn")
	var inst = shoot.instance()
	inst.connect("bullet1_queue_free",self,"bullet1_delete")
	add_child(inst)

	pass


