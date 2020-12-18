# StatsScoreTabs

extends Tabs

class_name StatsScoreTabs

"""
	Contains score statistics, including total plays for each stages, puzzles
	won/lost, score earned, and average score. Score data that the player can
	earn from a stage is also shown at the top right of the panel.
"""

#-------------------------------------------------
#      Sub-Classes
#-------------------------------------------------

#-------------------------------------------------
#      Signals
#-------------------------------------------------

signal diff_button_pressed

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const LIST_ALTER_BG_COLOR = Color(1, 1, 1, 0.1)

const LIST_ALTER_BG_MARGIN_RIGHT = 2000

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var diff_button : Button = $VBox/InfoHBox/DifficultyButton setget , get_diff_button
onready var diff_button_label : Label = $VBox/InfoHBox/DifficultyButton/Label

onready var info_score_per_puzzle_dlabel = $VBox/InfoHBox/ScoreInfoVBox/ScorePerPuzzleHBox/Data
onready var info_score_time_bonus_dlabel = $VBox/InfoHBox/ScoreInfoVBox/ScoreTimeBonusHBox/Data

onready var data_vbox_stage_name = $VBox/ScrollContainer/ListHBox/StageNameVBox/DataVBox
onready var data_vbox_win_lose = $VBox/ScrollContainer/ListHBox/WinLoseVBox/DataVBox
onready var data_vbox_score_earned = $VBox/ScrollContainer/ListHBox/ScoreEarnedVBox/DataVBox
onready var data_vbox_score_avg = $VBox/ScrollContainer/ListHBox/ScoreAvgVBox/DataVBox

var current_add_white_bg : bool

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

func set_diff_btn_self_modulate_color(col : Color):
	diff_button.self_modulate = col

func set_info_score_per_puzzle(score : int):
	info_score_per_puzzle_dlabel.text = str(score)

func set_info_score_time_bonus(score : int):
	info_score_time_bonus_dlabel.text = str(score)

func add_data(
	stage_name : String,
	win: int,
	lose: int,
	score_earned : int,
	score_avg : int
):
	# Add stage name label
	var label_stage_name := Label.new()
	label_stage_name.text = stage_name
#	label_stage_name.clip_text = true
	data_vbox_stage_name.add_child(label_stage_name)
	
	# Add win-lose label
	var label_win_lose = Label.new()
	label_win_lose.text = str(win, "-", lose)
	label_win_lose.align = Label.ALIGN_RIGHT
	data_vbox_win_lose.add_child(label_win_lose)
	
	# Add score earned label
	var label_score_earned = Label.new()
	label_score_earned.text = DigitFormatter.get_text(score_earned)
	label_score_earned.align = Label.ALIGN_RIGHT
	data_vbox_score_earned.add_child(label_score_earned)
	
	# Add score average label
	var label_score_avg = Label.new()
	label_score_avg.text = DigitFormatter.get_text(score_avg)
	label_score_avg.align = Label.ALIGN_RIGHT
	data_vbox_score_avg.add_child(label_score_avg)
	
	# Add white bg and await for the next two
	if current_add_white_bg:
		var bg = ColorRect.new()
		bg.color = LIST_ALTER_BG_COLOR
		bg.show_behind_parent = true
		bg.anchor_right = 1
		bg.anchor_bottom = 1
		bg.margin_right += LIST_ALTER_BG_MARGIN_RIGHT
		label_stage_name.add_child(bg)
	current_add_white_bg = !current_add_white_bg

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_DifficultyButton_pressed() -> void:
	emit_signal("diff_button_pressed")

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

func get_diff_button() -> Button:
	return diff_button
