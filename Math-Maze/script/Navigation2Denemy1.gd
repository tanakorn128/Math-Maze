extends Navigation2D
const FOLLOW_SPEED = 0.1
var MaxDistance = 450
var EnemyToPlayer
var t
var global
func _ready():
	print("set follow speed speed :", FOLLOW_SPEED)
	global = get_node("/root/Global")
	pass

var move = false
var movestart = false
func _process(delta):
	
	t = delta * FOLLOW_SPEED+0.01
	EnemyToPlayer = EnemyToPlayer()
	if EnemyToPlayer < MaxDistance:
		move_enemy(movestart)
		pass


func EnemyToPlayer():
	#var save_game = load("res://saves/save_01.tres")
	var EnemyToPlayer = global.player_pos - position
	return EnemyToPlayer.length()

func move_start(value):
	movestart = value



func move_enemy(value):
	move = value
	if move:
		#var save_game = load("res://saves/save_01.tres")
		var EnemyToPlayer = global.player_pos - position
		var enemy_pos = position
		enemy_pos.x-510
		enemy_pos.y-300
		self.get_simple_path(position,global.player_pos,true)
		position = position.linear_interpolate(global.player_pos,t)

