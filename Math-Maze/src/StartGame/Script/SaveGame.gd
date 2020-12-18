extends Node
var pathsave = "res://assets/Player/SaveCh1.json"
var pathhp = "res://assets/Player/Player.json"
var savegame = {
	"Start": "NotComplate",
	"Tree" : "Tree0",
	"Tree0": "NotComplete",
	"Tree1": "NotComplete",
	"Tree2": "NotComplete",
	"Tree3": "NotComplete",
	"Tree4": "NotComplete",
	"battle": "true"
}
var Player = {
  "HP": 100,
  "Name": "Gerlach"
}

var Data

func _ready():
	#Save_Game()
	#Data = load_SaveGame()
	#print(Data)
	pass

func Save_Game():
	var save_game = File.new()
	save_game.open_encrypted_with_pass(pathsave,File.WRITE, "mypass")
	var string_output = JSON.print(savegame.duplicate(true)," ")
	save_game.store_string(string_output)
	save_game.close()

func Save_json_Hp():
	var f = File.new()
	f.open(pathhp, File.WRITE)
	f.store_string(JSON.print(Player, "  ", true))
	f.close()
	
	
func load_SaveGame():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass(pathsave,file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;
