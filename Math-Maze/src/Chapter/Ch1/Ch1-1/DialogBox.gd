extends Node2D
var showdialog1
var showdialog2
var global
var path = "res://assets/story/chapter1/Shot.json";
var pathsave = "res://assets/Player/SaveCh1.json"
var showdialog
var savegame
func _ready():
	global = get_node("/root/Global")
	showdialog1 = str(global.showdialog1) #ดุงข้อมูลจาก global
	showdialog2 = str(global.showdialog2) #ดุงข้อมูลจาก global
	$DialogBox2.numshot=1

func _process(delta):
	dboxshow1()
	dboxshow2()
	showdialog1 = global.showdialog1 #ดุงข้อมูลจาก global
	showdialog2 = global.showdialog2 #ดุงข้อมูลจาก global
	closedialog()
	savegame = load_SaveGame()
	pass

func closedialog():
	var currentialogbox = $DialogBox.numshot
	var enddialogbox = load_showdialog()["end"]
	var end = int(enddialogbox)
	showdialog = load_showdialog()
	if currentialogbox > end:
		$DialogBox.hide()
		$DialogBox.numshot = 1
		showdialog["showdialog1"] = "false"
		save_showdialog()
		mission()
		#print(load_showdialog()["showdialog1"])
	pass

func save_showdialog():
	var save_game = File.new()
	save_game.open_encrypted_with_pass("res://assets/story/chapter1/showdialog.json",File.WRITE, "mypass")
	var string_output = JSON.print(showdialog.duplicate(true)," ")
	save_game.store_string(string_output)
	save_game.close()
	
func load_showdialog():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass("res://assets/story/chapter1/showdialog.json",file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;


func load_json():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass(path,file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;


func dboxshow1(): #แสดง DialogBox ด้านล้่าง
	if showdialog1 == "true":
		$DialogBox.Shot = load_json()
		$DialogBox.show()
	else:
		$DialogBox.hide()
		$DialogBox.numshot=1


func dboxshow2(): #แสดง DialogBox ตรงกลาง
	if showdialog2 == "true":
		$DialogBox2.show()
		pass
	else:
		$DialogBox2.hide()
		$DialogBox2.numshot=1
		
		

func load_SaveGame():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass(pathsave,file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;


func ChangeScene():
	var battle = savegame["battle"]
	if battle == "true":
		get_tree().change_scene("res://src/mission/m1/m1.tscn")
	

func mission():
	var tree = savegame["Tree"]
	var mission1 = savegame["Tree1"]
	var mission2 = savegame["Tree2"]
	var mission3 = savegame["Tree3"]
	var mission4 = savegame["Tree4"]
	if "Tree1" == tree:
		ChangeScene()
	else:
		pass
	if "Tree2" == tree:
		ChangeScene()
	if "Tree3" == tree:
		ChangeScene()
	if "Tree4" == tree:
		ChangeScene()
