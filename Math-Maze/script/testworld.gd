extends Node2D
var global
var time = 0
func _ready():
	end()
	add_hp()
	global = get_node("/root/Global")
	global.hp = 100
	var rand = RandomNumberGenerator.new()
	var screen_size = get_viewport().get_visible_rect().size
	for i in range(0,5):
		rand.randomize()
		var x = rand.randf_range(0,screen_size.x)
		var y = rand.randi_range(0,screen_size.y)
		print(x,y)
		#inst_enemy(x,y)
	#inst_enemy(-410,-300)
	put_enemy()

onready var follow = get_node("Path2D/follow")
func _process(delta):
	#follow.set_offset(follow.get_offset() + 250 *delta)
	#print(time)
	pass
func inst_enemy(positionX,positionY,alsprite,move):
	var enemy = load("res://scene/enemy1.tscn")
	var inst = enemy.instance()
	inst.enemy_position(positionX,positionY)
	inst.move_start(move)
	inst.alSprite(alsprite)
	add_child(inst)
	print("create inst_enemy")
	

func enemy(pos):
	if pos == 1:
		inst_enemy(-1500,0,2,true)
		
	if pos == 2:
		inst_enemy(1500,0,1,true)
		pass
	if pos == 3:
		inst_enemy(-2244.363,-413.882,1,true)
	if pos == 4:
		inst_enemy(-3667.934,2898.226,1,true)
	if pos == 5:
		inst_enemy(-4009.163,5214.987,2,true)
	if pos == 6:
		inst_enemy(-6935.735,1605.665,3,true)
	if pos == 7:
		inst_enemy(-9223.734,-26.335,1,true)
	if pos == 8:
		inst_enemy(1869.574,2318.619,2,true)
	if pos == 9:
		inst_enemy(1949.574,5278.619,3,true)
	if pos == 10:
		inst_enemy(4429.099,259.094,1,true)
	pass

func put_enemy():
	enemy(1)
	enemy(2)
	enemy(3)
	enemy(4)
	enemy(5)
	enemy(6)
	enemy(7)
	enemy(8)
	enemy(9)
	enemy(10)
	pass

func end():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var num = rng.randi_range(0, 1)
	var end  = load("res://scene/end.tscn")
	var inst_end = end.instance()
	if true:
		inst_end.end(1)
		add_child(inst_end)
		pass
	if  false:
		inst_end.end(2)
		add_child(inst_end)
		pass
	print(num)
	pass
func _on_Timer_timeout():
	time += 1
	pass # Replace with function body.
func add_hp():
	hp(0,400)
	hp(-400,-400)
	
	pass
func hp(posx,posy):
	var heart = load("res://scene/Heart.tscn")
	var inst_heart = heart.instance()
	inst_heart.hp(posx,posy)
	add_child(inst_heart)
	pass
