extends Node
var arrow = load("res://assets/arrow.png")
var beam = load("res://assets/beam.png")
func _ready():

	get_node("Tabs/SettingButton/Setting").speed_scale = 0.0001
	$Tabs/PlayButton/AnimationPlayer.play("PlayButtonPlay")
	Input.set_custom_mouse_cursor(arrow)
	Input.set_custom_mouse_cursor(beam, Input.CURSOR_IBEAM)



func _on_SettingButton_pressed():
	get_tree().change_scene("res://src/MainMenu/Setting.tscn")
	pass # Replace with function body.


func _on_HowToPlayButton_pressed():
	get_tree().change_scene("res://src/MainMenu/HowToPlay.tscn")
	pass # Replace with function body.


func _on_PlayButton_pressed():
	get_tree().change_scene("res://scene/world.tscn")
	pass # Replace with function body.


func _on_Timer_timeout():
	get_node("Tabs/SettingButton/Setting").speed_scale = 0.2
	get_node("Tabs/HowToPlayButton/AnimationPlayer").play("HotToPlay")
	pass # Replace with function body.


func _on_Timer2_timeout():
	get_node("Tabs/SettingButton/Setting").speed_scale = 0.0001
	get_node("Tabs/HowToPlayButton/AnimationPlayer").play("idle")
	pass # Replace with function body.
