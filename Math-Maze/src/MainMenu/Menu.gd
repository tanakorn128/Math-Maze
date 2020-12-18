extends Node2D

var save
var loadsave
func _ready():
	save = get_node("/root/SaveGame")
	loadsave = save.load_SaveGame()
func _on_Button_pressed():
	get_tree().quit()



func _on_start_game_pressed():
	get_tree().change_scene("res://src/Dialog gue Box/Scene/DialogBox.tscn")
	#SaveGame.Save_Game()
	#SaveGame.Save_json_Hp()
	


