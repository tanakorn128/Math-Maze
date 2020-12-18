# MainMenu/MainTabContainer/GameLog (Tabs)

extends Tabs

class_name MainMenuGameLog

"""
	No description available. Please make a request on GitHub issue tracker.
"""

#-------------------------------------------------
#      Sub-Classes
#-------------------------------------------------

#-------------------------------------------------
#      Signals
#-------------------------------------------------

signal close_btn_pressed

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const GAME_LOG_PANEL = preload("res://Src/Scene/MainMenu/MainTabContainer/GameLog/GameLogPanel/GameLogPanel.tscn")

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var scroll_container = $MarginContainer/Control/ScrollContainer
onready var log_vbox = $MarginContainer/Control/ScrollContainer/HBox/LogVBox
onready var log_data_vbox = $MarginContainer/Control/ScrollContainer/HBox/LogVBox/DataVBox
onready var log_display_hbox = $MarginContainer/Control/ScrollContainer/HBox/LogVBox/DisplayItemHBox
onready var log_display_item_label = $MarginContainer/Control/ScrollContainer/HBox/LogVBox/DisplayItemHBox/Value
onready var dim_color_rect = $DimColorRect
onready var no_data_label = $NoDataLabel
onready var game_log_detail_popup = $GameLogDetailPopup

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

func add_log(stages_data : Array, log_id : int, score : int, total_wins : int, timestamp : DateTime):
	var glog_panel = GAME_LOG_PANEL.instance()
	log_data_vbox.add_child(glog_panel)
	log_data_vbox.move_child(glog_panel, 0)
	glog_panel.hold_stages_data(stages_data)
	glog_panel.set_log_id(log_id)
	glog_panel.set_score(score)
	glog_panel.set_total_wins(total_wins)
	glog_panel.set_timestamp(timestamp)
	glog_panel.connect("detail_btn_pressed", self, "_on_detail_btn_pressed")
	
	_update_log_items_count()
	_make_space_for_log()

func update_stages_data(game_log_panel : GameLogPanel):
	# Clear the list of stages data first
	game_log_detail_popup.clear()
	
	# We iterate through stages data
	var idx : int
	for i in game_log_panel.stages_data:
		i = i as GameLog.LogStageData
		game_log_detail_popup.add_data(idx + 1, i.stage_data.stage_name, i.difficulty, i.score, i.max_score)
		idx += 1
	
	game_log_detail_popup.set_log_id(game_log_panel.log_id)
	
	game_log_detail_popup.popup()
	dim_color_rect.dim()

func reset_scroll():
	scroll_container.scroll_vertical = 0

#-------------------------------------------------
#      Connections
#-------------------------------------------------

# Connect from add_log()
func _on_detail_btn_pressed(game_log_panel : GameLogPanel) -> void:
	update_stages_data(game_log_panel)

func _on_CloseButton_pressed() -> void:
	emit_signal("close_btn_pressed")

func _on_GameLogDetailPopup_popup_hide() -> void:
	dim_color_rect.brightern()

func _on_GameLog_hide() -> void:
	reset_scroll()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _update_log_items_count():
	log_display_item_label.text = str(log_data_vbox.get_child_count())

func _make_space_for_log():
	log_display_hbox.show()
	no_data_label.hide()
	

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
