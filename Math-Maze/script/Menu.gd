extends Node2D
func _ready():
	$Tabs/play/AnimationPlayer.play("play")



func _on_play_button_down():
	get_tree().change_scene("res://scene/world.tscn")
	pass # Replace with function body.
