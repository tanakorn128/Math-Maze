extends Area2D

var velocity = Vector2(-350,0)
var positionY = 350
func _ready():
	gravity = 500
func _physics_process(delta):
	position.y -= positionY * delta
	velocity.y += gravity * delta
	position += velocity * delta
	rotation = velocity.angle()
	pass
	
