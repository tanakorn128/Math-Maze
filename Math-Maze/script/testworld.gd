extends Node2D

func _ready():
	var rand = RandomNumberGenerator.new()
	var screen_size = get_viewport().get_visible_rect().size
	for i in range(0,5):
		rand.randomize()
		var x = rand.randf_range(0,screen_size.x)
		var y = rand.randi_range(0,screen_size.y)
		print(x,y)
		#inst_enemy(x,y)
	#inst_enemy(-410,-300)
	enemy(1)
	enemy(2)

func inst_enemy(positionX,positionY):
	var enemy = load("res://scene/enemy1.tscn")
	var inst = enemy.instance()
	inst.enemy_position(positionX,positionY)
	add_child(inst)
	print("create inst_enemy")


func enemy(pos):
	if pos == 1:
		inst_enemy(-1000,0)
	if pos == 2:
		inst_enemy(1000,0)
	
	pass
