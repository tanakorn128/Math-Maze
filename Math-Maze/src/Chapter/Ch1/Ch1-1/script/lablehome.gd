extends CollisionShape2D
var start = false
var path = "res://assets/story/chapter1/Shot2.json";
var dictionary

func _unhandled_input(event):
	if event.is_action_pressed("ui_All"):
		start = true
func _on_lablehome_body_entered(body):
	if start:
		dictionary =load_json()
		dictionary["1"] = "Save"
		save_json()
		$DialogBoxV3.send_dialogbox(1,2)
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
