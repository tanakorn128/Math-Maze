extends Node2D


func end(value):
	if value == 1:
		self.position.x = -9204.781
		self.position.y = -669.418
	if value == 2:
		self.position.x = 615.518
		self.position.y = -2230.71
	pass


func _on_Area2D_body_entered(body):
	print("end")
	pass # Replace with function body.
