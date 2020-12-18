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
	enemy(3)
	enemy(4)
	enemy(5)
onready var follow = get_node("Path2D/follow")
func _process(delta):
	#follow.set_offset(follow.get_offset() + 250 *delta)
	
	pass
func inst_enemy(positionX,positionY):
	var enemy = load("res://scene/enemy1.tscn")
	var inst = enemy.instance()
	inst.enemy_position(positionX,positionY)
	add_child(inst)
	print("create inst_enemy")


func enemy(pos):
	if pos == 1:
		inst_enemy(-1500,0)
	if pos == 2:
		inst_enemy(1500,0)
		pass
	if pos == 3:
		inst_enemy(-2244.363,-413.882)
	if pos == 4:
		inst_enemy(-3667.934,2898.226)
	if pos == 5:
		inst_enemy(-4009.163,5214.987)
	pass


