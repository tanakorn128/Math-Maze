extends Node2D
var Data;
var Pictures = preload("res://assets/canvas/canvas Bule.png");
var Correct = null;
var SpaceBar_NotCorrect = true;
var LeftClick
var moust_over_control_answer1;
var moust_over_control_answer2;
var moust_over_control_answer3;
var moust_over_control_answer4;
var count = 0;
var arrow = load("res://assets/arrow.png")
var beam = load("res://assets/beam.png")
var HP_NPC = 100
var HP_PLAYER = int(hp_Load().HP)
var No # ข้อสอบที่
var click = true;
export var min_exam = 0;
export var max_exam = 39;
export var countdown = 60
var mission = null
func _ready():
	random_exam()
	Update()
	Input.set_custom_mouse_cursor(arrow)
	Input.set_custom_mouse_cursor(beam, Input.CURSOR_IBEAM)
	$dialog.hide()
	HP_PLAYER = hp_Load().HP
	$Life/Player.value = HP_PLAYER
	var data = Exam2()
	
func _process(delta):
	Check() #Check Mouse Click
	hp()   # Player
	key_input()
	

	
func key_input():
	if (Input.is_action_pressed("ui_interact") and SpaceBar_NotCorrect):
		countdown = 60
		more_exam_Not_correct()
		more_exam_correct()
		$dialog.hide()
		click = true
		click = true
		CheckMission()
		pass

func Update():
	Data = load_json()
	Exam()


func Exam():	
	get_node("Data/Data/answer1/Text").text = str(Data[No].answer1)
	get_node("Data/Data/answer2/Text").text = str(Data[No].answer2)
	get_node("Data/Data/answer3/Text").text = str(Data[No].answer3)
	get_node("Data/Data/answer4/Text").text = str(Data[No].answer4)
	get_node("Data/Data/question/Label").text = str(Data[No].Question)
	#get_node("Data/Data/pictures/Pictures").texture = load(Data.pictures)
	
func random_exam():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random_number = rng.randf_range(min_exam, max_exam)
	No = int(random_number)
	Update()
	
func Check():
	Update()
	LeftClick = Input.is_mouse_button_pressed(BUTTON_LEFT)
	if(moust_over_control_answer1 and LeftClick): 
		Correct = Data[No].answer1
	if(moust_over_control_answer2 and LeftClick): 
		Correct = Data[No].answer2
	if(moust_over_control_answer3 and LeftClick): 
		Correct = Data[No].answer3
	if(moust_over_control_answer4 and LeftClick): 
		Correct = Data[No].answer4
	
	if(str(Data[No].Correct) == str(Correct) and LeftClick and click): 
		correct()
		click = false
	if (str(Data[No].Correct) != str(Correct) and LeftClick and click): 
		click = false
		Not_correct()




func load_json():
	var dictTemp;
	var file = File.new();
	var path = "res://assets/Exam/chapter1.json";
	file.open(path,file.READ);
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;

func _on_answer1_mouse_entered():
	moust_over_control_answer1 = true;
	pass # Replace with function body.


func _on_answer1_mouse_exited():
	moust_over_control_answer1 = false;
	pass # Replace with function body.

func _on_answer2_mouse_entered():
	moust_over_control_answer2 = true;
	pass # Replace with function body.


func _on_answer2_mouse_exited():
	moust_over_control_answer2 = true;
	pass # Replace with function body.


func _on_answer3_mouse_entered():
	pass # Replace with function body.
	moust_over_control_answer3 = true;

func _on_answer3_mouse_exited():
	pass # Replace with function body.
	moust_over_control_answer3 = false;

func _on_answer4_mouse_entered():
	pass # Replace with function body.
	moust_over_control_answer4 = true;

func _on_answer4_mouse_exited():
	moust_over_control_answer4 = false;
	pass # Replace with function body.


func _on_countdown_timeout():
	$countdown/countdownProgress.value = int(countdown) 
	
	if (countdown == 0):
		$dialog.show()
		get_node("dialog/Dialog Box/Body_NinePatchRect/MarginContainer/Label2").text = "เวลาหมด"
		mission = "TimeOut"
	if (countdown != 0): countdown -= 1
	pass # Replace with function body.
	
func hp():
	if (HP_PLAYER <30): $Life/Player.texture_progress = load("res://assets/Lifebars/VIDA_11.png")
	else: $Life/Player.texture_progress = load("res://assets/Lifebars/VIDA_10.png")
	
	if(HP_PLAYER < 0): 
		HP_PLAYER = 0;
	if(HP_PLAYER > 100): 
		HP_PLAYER = 100
	#if(HP_NPC < 0):
	#	 HP_NPC = 0
		
#	if(HP_NPC > 100): 
#		HP_NPC = 100
	get_node("Life/NPC").value = HP_NPC
	pass

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
	
func Exam2():
	var dictTemp;
	var file = File.new();
	var path = "res://assets/Exam/chapter2.json";
	file.open(path,file.READ);
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;
	

func hp_Save(Update):
	var Data = hp_Load()
	Data.HP = Update
	var f = File.new()
	var path = "res://assets/Player/Player.json";
	f.open(path, File.WRITE)
	f.store_string(JSON.print(Data, "  ", true))
	f.close()
	pass
	
func Not_correct():
	$dialog.show()
	get_node("dialog/Dialog Box/Body_NinePatchRect/MarginContainer/Label2").text = "คำตอบไม่ถูกต้อง"
	
	HP_PLAYER -= 4.5
	$Life/Player.value = HP_PLAYER
	hp_Save(HP_PLAYER)
	if (HP_PLAYER <= 0):
		get_node("dialog/Dialog Box/Body_NinePatchRect/MarginContainer/Label2").text = "แพ้แล้ว"
		mission = "lose"
	



func correct():
	get_node("dialog/Dialog Box/Body_NinePatchRect/MarginContainer/Label2").text = "คำตอบถูกต้อง"
	HP_NPC -= 40.5
	$Life/Player.value = HP_PLAYER
	hp_Save(HP_PLAYER)
	get_node("Life/NPC").value = HP_NPC
	if(HP_NPC <= 0):
		get_node("dialog/Dialog Box/Body_NinePatchRect/MarginContainer/Label2").text = "ชนะแล้ว"
		mission = "win"
	$dialog.show()
	
func CheckMission():
	if mission == "win":
		get_tree().change_scene("res://src/World.tscn")
	if mission == "lose":
		get_tree().change_scene("res://src/World.tscn")

	pass
func more_exam_Not_correct():
	if(HP_NPC > 0):
		random_exam()
		pass
	
func more_exam_correct():
	if(HP_NPC > 0):
		random_exam()
		pass
