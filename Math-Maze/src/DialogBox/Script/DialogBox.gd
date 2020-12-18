extends Node2D
signal End
signal End2
func _ready():
	get_node("Text/AnimationPlayer").play("Present_Visible")
	
	pass

func _process(delta):
	
	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("End")
	pass # Replace with function body.
