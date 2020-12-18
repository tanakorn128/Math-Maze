# StatisticsTabContainer

extends TabContainer

class_name StatisticsTabContainer

"""
	No description available. Please make a request on GitHub issue tracker.
"""

#-------------------------------------------------
#      Sub-Classes
#-------------------------------------------------

#-------------------------------------------------
#      Signals
#-------------------------------------------------

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const STATS_SCORE_TABS = preload("res://Src/Scene/MainMenu/MainTabContainer/PlayerStats/StatisticsTabContainer/StatsScoreTabs.tscn")

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var general_total_score_lb = $"ภาพรวม/MarginContainer/Control/VBox/TotalScoreVBox/Value"
onready var general_total_win_lose_lb = $"ภาพรวม/MarginContainer/Control/VBox/LargeDataHBox/WinLoseVBox/Value"
onready var general_high_score_lb = $"ภาพรวม/MarginContainer/Control/VBox/LargeDataHBox/HighScoreVBox/ValueLabelHBox/Value"
onready var general_play_time_lb = $"ภาพรวม/MarginContainer/Control/VBox/SmallInfoHBox/HBox/TimePlayedPanel/VBoxContainer/Value"
onready var general_total_games_played_lb = $"ภาพรวม/MarginContainer/Control/VBox/SmallInfoHBox/HBox/GamesPlayedPanel/VBoxContainer/Value"
onready var general_total_played_lb = $"ภาพรวม/MarginContainer/Control/VBox/SmallInfoHBox/HBox2/PuzzlesPlayedPanel/VBoxContainer/Value"
onready var general_avg_score_lb = $"ภาพรวม/MarginContainer/Control/VBox/SmallInfoHBox/HBox2/AvgPanel/VBoxContainer/Value"

onready var stats_score_tabs_container = $"คะแนนของฉัน/MarginContainer/Control/StatsScoreTabsContainer"

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

func update_total_score(num : int):
	general_total_score_lb.text = DigitFormatter.get_text(num)

func update_high_score(num : int):
	general_high_score_lb.text = DigitFormatter.get_text(num)

func update_total_win_lose(wins : int, losses):
	general_total_win_lose_lb.text = str(wins, "-", losses)

func update_time_elapsed(seconds : float):
	general_play_time_lb.text = TimeFormatter.get_time_format(seconds, false)

func update_total_games_played(num : int):
	general_total_games_played_lb.text = DigitFormatter.get_text(num)

func update_total_played(num : int):
	general_total_played_lb.text = DigitFormatter.get_text(num)

func update_avg_score(num : int):
	general_avg_score_lb.text = DigitFormatter.get_text(num)

func next_stats_score_tab():
	stats_score_tabs_container.current_tab = wrapi(stats_score_tabs_container.current_tab + 1, 0, stats_score_tabs_container.get_tab_count())

func create_stats_score_tabs() -> StatsScoreTabs:
	var stats_score_tabs = STATS_SCORE_TABS.instance()
	stats_score_tabs_container.add_child(stats_score_tabs)
	stats_score_tabs.connect("diff_button_pressed", self, "_on_stats_score_tabs_diff_btn_pressed")
	
	return stats_score_tabs

func get_stats_score_tab_idx(idx : int) -> StatsScoreTabs:
	return stats_score_tabs_container.get_child(idx)

#-------------------------------------------------
#      Connections
#-------------------------------------------------

# Connect from _create_stats_score_tabs() child's instance
func _on_stats_score_tabs_diff_btn_pressed():
	next_stats_score_tab()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
