extends Node2D
signal End
signal End2
func _ready():
	get_node("Text/AnimationPlayer").play("Present_Visible")
	pass

func _process(delta):
	if Input.is_action_pressed("ui_spacebar"):
		$Timer.start()
	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("End")
	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
	get_tree().change_scene("res://src/MainMenu/Menu.tscn")
	$Timer.stop()
	pass # Replace with function body.
