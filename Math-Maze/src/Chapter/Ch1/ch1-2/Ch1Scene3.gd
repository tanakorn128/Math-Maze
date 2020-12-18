extends Node2D
signal Tree1
signal Tree2
signal Tree3
signal Tree4

var InputEven = false
func _input(event):
	if ((event.as_text() == "A") or (event.as_text() == "D") or (event.as_text() == "W") or (event.as_text() == "S")):
		InputEven = true

func _on_Tree1_body_entered(body):
	if InputEven:
		emit_signal("Tree1")
	pass # Replace with function body.


func _on_Tree2_body_entered(body):
	if InputEven:
		emit_signal("Tree2")
	pass # Replace with function body.


func _on_Tree3_body_entered(body):
	if InputEven:
		emit_signal("Tree3")
	pass # Replace with function body.


func _on_Tree4_body_entered(body):
	if InputEven:
		emit_signal("Tree4")
	pass # Replace with function body.
