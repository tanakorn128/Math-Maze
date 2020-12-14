extends Navigation2D
const FOLLOW_SPEED = 0.5
var MaxDistance = 250
var EnemyToPlayer
var t
func _process(delta):
	t = delta * FOLLOW_SPEED
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
	self.get_simple_path(position,save_game.player_pos,true)
	position = position.linear_interpolate(save_game.player_pos,t)

