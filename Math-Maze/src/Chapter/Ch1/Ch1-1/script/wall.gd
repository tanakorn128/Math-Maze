extends TileMap
var pathsave = "res://assets/Player/SaveCh1.json"
var savegame


func _process(delta):
	ClearTree()
	
	pass


func ClearTree():
	savegame = load_SaveGame()
	if savegame["Tree1"] == "Complete":
		$Task_Tree1.hide()
	
	if savegame["Tree2"] == "Complete":
		$Task_Tree2.hide()
	pass



func load_SaveGame():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass(pathsave,file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;


