# GameLogPanel

extends Panel

class_name GameLogPanel

"""
	A panel containing data that can be modified through code. These include:
	- Score
	- Number of puzzles won
	- List of puzzle results
	- Timestamp
"""

#-------------------------------------------------
#      Sub-Classes
#-------------------------------------------------

#-------------------------------------------------
#      Signals
#-------------------------------------------------

signal detail_btn_pressed(game_log_panel)

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const TEXT_SCORE = "คะแนน"
const TEXT_PUZZLE_WON_PREFIX = "เล่นชนะไป"
const TEXT_PUZZLE_WON_POSTFIX = "ปริศนา"
const TEXT_AGO = "ที่แล้ว"

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var game_log_id_label = $VBox/GameModeTitle/GameLogIDHBox/Value
onready var score_label = $VBox/ScoreInfoHBox/ScoreLabel
onready var total_wins_label = $VBox/TotalWinDateTImeHBox/TotalWinsLabel
onready var timestamp_label = $VBox/TotalWinDateTImeHBox/TimestampHBox/TimestampLabel
onready var ago_label = $VBox/TotalWinDateTImeHBox/TimestampHBox/AgoLabel
onready var detail_btn = $VBox/ScoreInfoHBox/DetailBtn

var log_id : int
var stages_data : Array
var score : int
var count : int
var timestamp : DateTime

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func set_log_id(id : int):
	game_log_id_label.text = str(id)
	log_id = id

func hold_stages_data(game_log_stages_arr : Array):
	stages_data = game_log_stages_arr

func set_score(_score : int):
	score_label.text = DigitFormatter.get_text(_score) + " " + TEXT_SCORE
	score = _score

func set_total_wins(_count : int):
	total_wins_label.text = TEXT_PUZZLE_WON_PREFIX + " " + str(_count) + " " + TEXT_PUZZLE_WON_POSTFIX
	count = _count

func set_timestamp(datetime : DateTime):
	timestamp_label.text = datetime.get_full_text_thai()
	timestamp = datetime
	update_timestamp_ago()

func update_timestamp_ago():
	if timestamp == null:
		return
	
	var current_datetime = DateTime.new()
	current_datetime.dict2obj(OS.get_datetime())
	
	ago_label.text = TimeFormatter.get_time_format(timestamp.get_seconds_difference(current_datetime)) + TEXT_AGO

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_DetailBtn_pressed() -> void:
	emit_signal("detail_btn_pressed", self)

func _on_TimestampUpdateTimer_timeout() -> void:
	update_timestamp_ago()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
