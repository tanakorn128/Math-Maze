extends Node2D
var hp
var pathsave = "res://assets/Player/SaveCh1.json"
var savegame

func _ready():
	var Exam = get_tree().get_root().find_node("Exam",true,false)
	Exam.connect("Correct",self,"Correct")
	Exam.connect("NotCorrect",self,"NotCorrect")
	pass
	
func Correct():
	$TextureProgress.value -= 20
	end()
	pass
func NotCorrect():
	end()
	pass

func end():
	hp = $TextureProgress.value
	if hp <= 0:
		savegame = load_SaveGame()
		var value = savegame["Tree"]
		savegame[value] = "Complete"
		savegame["Tree"] = "Tree0"
		Save_Game()
		get_tree().change_scene("res://src/Chapter/Ch1/Ch1-1/ch1.tscn")

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
