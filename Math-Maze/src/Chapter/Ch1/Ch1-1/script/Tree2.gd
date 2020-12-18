extends CollisionShape2D
var start = false
var path = "res://assets/story/chapter1/Shot2.json";
var pathsave = "res://assets/Player/SaveCh1.json"
var dictionary
var savegame


func _process(delta):
	if Input.is_action_just_pressed("ui_All"):
		start = true

func _on_Tree2_body_entered(body):
	if start:
		#print("sss")
		mission()
	pass # Replace with function body.


func load_json():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass(path,file.READ, "mypass");
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

func mission():
	dictionary =load_json()
	savegame = load_SaveGame()
	if savegame["Tree2"] == "NotComplete":
		dictionary["1"] = "ตัดต้นไม้ต้นที่ 2 ???"
		save_json()
		$DialogBoxV3.send_dialogbox(1,2)
		savegame["Tree"] = "Tree2"
		Save_Game()
	pass
