extends Button
var dictionary = {}
var dir = "res://./exam"
var save_path = "res://./exam/chater1.json"
func _on_remove_pressed():
	remove_json()
	pass # Replace with function body.
func save_json():
	var save_game = File.new()
	save_game.open_encrypted_with_pass(save_path,File.WRITE,"mypass")
	var string_output = JSON.print(dictionary.duplicate(true)," ")
	save_game.store_string(string_output)
	save_game.close()
	pass
func remove_json():
	var dictTemp;
	var file = File.new();
	#var path = "res://./exam/chater1.json";
	file.open_encrypted_with_pass(save_path,file.READ,"mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	print(dictTemp)
	if(dictTemp.empty()):
		pass
	else:
		dictTemp.clear()
		print("t")
	save_json()

