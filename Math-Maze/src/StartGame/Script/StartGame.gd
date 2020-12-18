extends Node2D
var showdialog1
var showdialog2
var global
var path = "res://assets/story/chapter1/Shot.json";
var pathname = "res://assets/Player/Player.json";
var showdialog
var Next = false
var playername
func _ready():
	global = get_node("/root/Global")
	showdialog1 = str(global.showdialog1) #ดุงข้อมูลจาก global
	showdialog2 = str(global.showdialog2) #ดุงข้อมูลจาก global
	

func _process(delta):
	dboxshow1()
	showdialog1 = global.showdialog1 #ดุงข้อมูลจาก global
	showdialog2 = global.showdialog2 #ดุงข้อมูลจาก global
	closedialog()
	inputname()
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
		print(load_showdialog()["showdialog1"])
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

func _input(event):
	if event.is_action_pressed("ui_interact"):
		Next =true

func dboxshow1(): #แสดง DialogBox ด้านล้่าง
	if showdialog1 == "true":
		$DialogBox.Shot = load_json()
		$DialogBox.show()
		#$Tabs.hide()
	else:
		$DialogBox.hide()
		$DialogBox.numshot=1
		if Next:
			ChangeScene()


func ChangeScene():
	get_tree().change_scene("res://src/Chapter/Ch1/Ch1-1/ch1.tscn")
	pass

func inputname():
	if $DialogBox.numshot == 22:
		$Tabs.show()
	else:
		$Tabs.hide()
		playername = load_player()
		playername["Name"] = get_node("Tabs/Name").text
		Save_player()
		pass
	if $DialogBox.numshot == 24:
		 ChangeScene()

func load_player():
	var dictTemp;
	var file = File.new();
	file.open(pathname,file.READ);
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;

func Save_player():
	var f = File.new()
	f.open(pathname, File.WRITE)
	f.store_string(JSON.print(playername, "  ", true))
	f.close()
