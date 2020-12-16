extends Navigation2D
const FOLLOW_SPEED = 0.5
var MaxDistance = 250
var EnemyToPlayer
var t

func _ready():
	print("set follow speed speed :", FOLLOW_SPEED)
	pass

func _process(delta):
	t = delta * FOLLOW_SPEED+0.01
	EnemyToPlayer = EnemyToPlayer()
	if EnemyToPlayer < MaxDistance:
		move_enemy()


func EnemyToPlayer():
	var save_game = load("res://saves/save_01.tres")
	var EnemyToPlayer = save_game.player_pos - position
	return EnemyToPlayer.length()


func move_enemy():
	var save_game = load("res://saves/save_01.tres")
	var EnemyToPlayer = save_game.player_pos - position
	var enemy_pos = position
	enemy_pos.x-510
	enemy_pos.y-300
	self.get_simple_path(position,save_game.player_pos,true)
	position = position.linear_interpolate(save_game.player_pos,t)

