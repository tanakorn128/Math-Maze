extends Node2D
var SigTree1
var T1 = false
var T2 = false
var T3 = false
var T4 = false
var Global
const speed = 0
const speed1 = 15000
func _ready():
	Global = get_node("/root/Global")
	SigTree1 = get_tree().get_root().find_node("Scene3",true,false)
	SigTree1.connect("Tree1",self,"Tree1")
	SigTree1.connect("Tree2",self,"Tree2")
	SigTree1.connect("Tree3",self,"Tree3")
	SigTree1.connect("Tree4",self,"Tree4")
	$Tree1.hide()
	

func Tree1():
	$Tree1.show()
	$Tree1.numshot = 1
	$Tree1.Shot["1"] = "ตัดต้นไม้ต้นที่ 1 ???"
	$Tree1.print_dialog()
	T1 = true
	Global.speed = 0
	print("Tree1")
func Tree2():
	$Tree2.show()
	$Tree2.numshot = 1
	$Tree2.Shot["1"] = "ตัดต้นไม้ต้นที่ 2 ???"
	$Tree2.print_dialog()
	T2 = true
	print("2")
	pass
	
func Tree3():
	$Tree3.show()
	$Tree3.numshot = 1
	$Tree3.Shot["1"] = "ตัดต้นไม้ต้นที่ 3 ???"
	$Tree3.print_dialog()
	T3 = true
	print("3")
	pass
	
func Tree4():
	$Tree4.show()
	$Tree4.numshot = 1
	$Tree4.Shot["1"] = "ตัดต้นไม้ต้นที่ 4 ???"
	$Tree4.print_dialog()
	T2 = true
	print("4")
	pass

func _input(event):
	if (event.as_text() == "Space" and T1):
		$Tree1.hide()
		Global.speed = speed1
		get_tree().change_scene("res://src/mission/Fight1.tscn")
		
		
	if (event.as_text() == "Space" and T2):
		Chane_Scent_Fight1()
		pass
		
		
	if (event.as_text() == "Space" and T3):
		Chane_Scent_Fight1()
		pass
		
	if (event.as_text() == "Space" and T4):
		Chane_Scent_Fight1()
		pass

func Chane_Scent_Fight1():
	$Tree1.hide()
	Global.speed = speed1
	get_tree().change_scene("res://src/mission/Fight1.tscn")
