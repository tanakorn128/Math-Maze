extends Node2D
var SpaceBar = false
var global
var hp 
func _ready():
	var Exam = get_tree().get_root().find_node("Exam",true,false)
	Exam.connect("Correct",self,"Correct")
	Exam.connect("NotCorrect",self,"NotCorrect")
	global = get_node("/root/Global")
	hp = hp_Load()
	pass
	
func Correct():
	pass
func NotCorrect():
	$ColorRect/Label.text = str("เฉลย "+global.Correct)
	$ColorRect.show()
	$Tabs.show()
	$Timer.start()
	pass



func _on_Timer_timeout():
	#$ColorRect.hide()
	pass # Replace with function body.


func _on_Button_pressed():
	$ColorRect.hide()
	$Tabs.hide()
	endgame()
	pass # Replace with function body.

func hp_Load():
	var dictTemp;
	var file = File.new();
	var path = "res://assets/Player/Player.json";
	file.open(path,file.READ);
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;
	
	
func endgame():
	print(hp["HP"])
	hp = hp_Load()
	if int(hp["HP"]) <= 0:
		get_tree().change_scene("res://src/Chapter/Ch1/Ch1-1/ch1.tscn")
		pass
