extends Node2D
var srart = false
func _input(event):
	if event.is_action_pressed("ui_All"):
		srart  = true
		pass
	pass

func _on_Tree1_body_entered(body):
	if srart:
		pass
	pass # Replace with function body.


func _on_Tree2_body_entered(body):
	if srart:
		print("2")
	pass # Replace with function body.
	
func _on_Tree3_body_entered(body):
	if srart:
		print("3")
	pass # Replace with function body.

func _on_Tree4_body_entered(body):
	if srart:
		print("4")
	pass # Replace with function body.


func _on_lablehome_body_entered(body):
	if srart:
		print("L")
	pass # Replace with function body.




func _on_lable3_body_entered(body):
	pass # Replace with function body.


func _on_lable4_body_entered(body):
	pass # Replace with function body.


func _on_lable41_body_entered(body):
	pass # Replace with function body.


func _on_End_body_entered(body):
	pass # Replace with function body.
