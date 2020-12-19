extends Node2D
var global

func _ready():
	global = get_node("/root/Global")
	$AnimationPlayer.play("Heart")
	add_hp()
	pass 


func _on_Area2D_body_entered(body):
	add_hp()
	queue_free()
	pass # Replace with function body.

func hp(posx,posy):
	self.position.x = posx
	self.position.y = posy
	pass

func add_hp():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var hpmax = 100 - global.hp
	var num = rng.randi_range(0, hpmax)
	if global.hp < 100:
		global.hp = global.hp + num
	pass
