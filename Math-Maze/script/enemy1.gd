extends Node2D
var exam = load("res://scene/Exam.tscn")
var insts = exam.instance()
var child_num = 1
export (Script) var save_game
var global
func _ready():
	#enemy_position(-510,-300)
	print("create enemy position (X,Y) :" ,$Navigation2D.position)
	shoot_bullet1()
	$battle/BackGround/bullet1.connect("attack_enemy",self,"attack_enemy") #สัญญาณผู้เล่นยิงศตรู
	$battle/BackGround/bullet2.connect("attack_enemy",self,"attack_enemy2") #สัญญาณศตรูยิงผู้เล่น
	insts.connect("my_exam_hit",self,"exam_hit") #สัญญาณตอบถูก
	insts.connect("my_exam_lost",self,"exam_lost") #สัญญาณตอบผิด
	global = get_node("/root/Global")
	pass

func _process(delta):
	if child_num == 1: #ตรวจการชนสตรู
		if $Navigation2D/KinematicBody2D/RayCast2D.is_colliding():
			inst_exam()
			child_num+=1
			global.player_colliding = true
			global.speed_player = 0

func exam_hit(): #ตรวจคำตอบแล้วถูก
	print("hit")
	insts.hide()
	battle_hit()
	

func exam_lost(): #ตรวจคำตอบแล้วผิด
	print("คำตอบผิด")
	insts.signal_enemy("lost") 
	battle_lost()


func enemy_position(positionX,positionY): # ตำแหน่งหน้าต่อสู้
	$Navigation2D.position.x = positionX
	$Navigation2D.position.y = positionY
	pass

func attack_enemy(): #โดนโจมตีศัตร เลือดู
	print("attack_enemy")
	$battle/BackGround/HUD2/TextureProgress.value -= 20
	$Timer.start()

func attack_enemy2(): #โดนโจมตีเสียผู้เล่น เลือด
	$battle/BackGround/HUD1/TextureProgress.value -= 20
	$Timer.start()
	pass


func inst_exam(): #opject ข้อสอบ
	#var save_game = load("res://saves/save_01.tres")
	insts.position.x = global.player_pos.x-510
	insts.position.y = global.player_pos.y-300
	add_child(insts)
	print("create object exam position :",insts.position)

func battle_hit(): #ตอบถูกต่อสู้
	#var save_game = load("res://saves/save_01.tres")
	insts.signal_enemy("hit") #สุ่มข้อสอบใหม
	$battle/BackGround.position.x = global.player_pos.x-510
	$battle/BackGround.position.y = global.player_pos.y-300
	$battle/BackGround.show()
	$battle/BackGround/bullet1.shoot()
	pass

func battle_lost(): #ตอยผิดต่อสู้
	insts.hide()
	#var save_game = load("res://saves/save_01.tres")
	insts.signal_enemy("hit") #สุ่มข้อสอบใหม
	$battle/BackGround.position.x = global.player_pos.x-510
	$battle/BackGround.position.y = global.player_pos.y-300
	$battle/BackGround.show()
	shoot_bullet2()
	$Timer.start()
	pass
	

func shoot_bullet1(): #ยิงศัตรู
	print("create object bullet1 position :", $battle/BackGround/bullet1.position)
	$battle/BackGround/bullet1.position.y = $battle/BackGround/player.position.y-150
	$battle/BackGround/bullet1.position.x = $battle/BackGround/player.position.x
	print($battle/BackGround/bullet1.position)
	
	

func shoot_bullet2(): # ยิงผู้เล่น
	$battle/BackGround/bullet2.position.y = $battle/BackGround/enemy.position.y-150
	$battle/BackGround/bullet2.position.x = $battle/BackGround/enemy.position.x
	$battle/BackGround/bullet2.shoot()
	pass



func _on_Timer_timeout(): #หน่วงเวลาโจตี
	global.hp = $battle/BackGround/HUD1/TextureProgress.value
	queue_free_enemy()
	$battle/BackGround.hide()
	insts.show()
	$Timer.stop()
	pass # Replace with function body.
	
func queue_free_enemy():
	if $battle/BackGround/HUD1/TextureProgress.value <= 0:
		queue_free()
		var global = get_node("/root/Global")
		global.speed_player = 15000
	if $battle/BackGround/HUD2/TextureProgress.value <= 0:
		queue_free()
		var global = get_node("/root/Global")
		global.speed_player = 15000
	pass

