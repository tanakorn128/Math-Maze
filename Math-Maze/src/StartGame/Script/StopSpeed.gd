extends Node2D
signal Th
var path = "res://assets/story/chapter1/showdialog.json";
var global
var dictionary={
	"showdialog1": "false",
	"showdialog2": "false",
	"end": "4"
}


func _on_Button_pressed():
	#save_json()
	
	
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
