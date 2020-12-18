extends Node2D
#scene1-scene13
var path = "res://assets/story/chapter1/Shot2.json";
var pathsave = "res://assets/Player/SaveCh1.json"
var DataScene3;
var global
var global2
var dictionary
var dictionary2
var nent = 2
var savegame
var boolshot = false
func _ready():
	print(savegame)
	savegame = load_SaveGame()
	
	if savegame["Start"] == "NotComplate":
		savegame = load_SaveGame()
		print(savegame)
		dictionary2 = load_dialog()
		dictionary2["showdialog1"] = "true"
		dictionary2["end"] = "14"
		#print(dictionary2)
		save_dialog()
		#print(dictionary2)
		dictionary =load_json()
		dictionary["1"] = "Hi...."
		dictionary["2"] = load_story2()["shot2"]
		dictionary["3"] = load_story2()["shot3"]
		dictionary["4"] = load_story2()["shot4"]
		dictionary["5"] = load_story2()["shot5"]
		dictionary["6"] = load_story2()["shot6"]
		dictionary["7"] = load_story2()["shot7"]
		dictionary["8"] = load_story2()["shot8"]
		dictionary["9"] = load_story2()["shot9"]
		dictionary["10"] = load_story2()["shot10"]
		dictionary["11"] = load_story2()["shot11"]
		dictionary["12"] = load_story2()["shot12"]
		dictionary["13"] = load_story2()["shot13"]
		dictionary["14"] = "!!!!!"
		savegame["Start"] = "Complate"
		save_json()
		Save_Game()
func _input(event):
	if event.is_action_pressed("ui_interact"):
		
		if nent > 14 and boolshot:
			dictionary2["showdialog1"] = "false"
			save_dialog()
	elif boolshot:
		nent+=1
		#print("x")
		pass




func load_json():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass(path,file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;

func load_story2():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass("res://assets/story/chapter1/story2.json",file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;

func load_dialog():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass("res://assets/story/chapter1/showdialog.json",file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;

func save_json():
	var save_game = File.new()
	save_game.open_encrypted_with_pass(path,File.WRITE, "mypass")
	var string_output = JSON.print(dictionary.duplicate(true)," ")
	save_game.store_string(string_output)
	save_game.close()

func save_dialog():
	var save_game = File.new()
	save_game.open_encrypted_with_pass("res://assets/story/chapter1/showdialog.json",File.WRITE, "mypass")
	var string_output = JSON.print(dictionary2.duplicate(true)," ")
	save_game.store_string(string_output)
	save_game.close()

func load_SaveGame():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass(pathsave,file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;

func Save_Game():
	var save_game = File.new()
	save_game.open_encrypted_with_pass(pathsave,File.WRITE, "mypass")
	var string_output = JSON.print(savegame.duplicate(true)," ")
	save_game.store_string(string_output)
	save_game.close()


