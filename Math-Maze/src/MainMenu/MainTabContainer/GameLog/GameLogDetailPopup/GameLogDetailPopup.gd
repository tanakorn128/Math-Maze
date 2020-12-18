# MainMenu/MainTabContainer/GameLog/GameLogDetailPopup (PopupPanel)

extends PopupPanel

#class_name

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

const LIST_ALTER_BG_COLOR = Color(1, 1, 1, 0.1)

const LIST_ALTER_BG_MARGIN_RIGHT = 2000

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var log_id_label = $Control/MarginContainer/VBox/TitleHBox/LogID
onready var data_vbox_no = $Control/MarginContainer/VBox/ScrollContainer/HBox/NoVBox/DataVBox
onready var data_vbox_name = $Control/MarginContainer/VBox/ScrollContainer/HBox/NameVBox/DataVBox
onready var data_vbox_score = $Control/MarginContainer/VBox/ScrollContainer/HBox/ScoreVBox/DataVBox
onready var data_vbox_difficulty = $Control/MarginContainer/VBox/ScrollContainer/HBox/DifficultyVBox/DataVBox
onready var scroll_container = $Control/MarginContainer/VBox/ScrollContainer

var current_add_white_bg

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
	log_id_label.text = str(id)

func add_data(no : int, stage_name : String, difficulty : int, score : int, max_score : int):
	var lb_no = Label.new()
	var lb_name = Label.new()
	var lb_difficulty = Label.new()
	var lb_score = Label.new()
	var lb_percent = Label.new()
	
	lb_no.text = str(no)
	lb_name.text = stage_name
	lb_difficulty.text = GlobalDifficulty.DIFFICULTY_NAMES[difficulty]
	lb_score.text = str(score, " / ", max_score)
	
	lb_difficulty.align = Label.ALIGN_RIGHT
	lb_score.align = Label.ALIGN_RIGHT
	
	data_vbox_no.add_child(lb_no)
	data_vbox_name.add_child(lb_name)
	data_vbox_difficulty.add_child(lb_difficulty)
	data_vbox_score.add_child(lb_score)
	
	# Add white bg and await for the next two
	if current_add_white_bg:
		var bg = ColorRect.new()
		bg.color = LIST_ALTER_BG_COLOR
		bg.show_behind_parent = true
		bg.anchor_right = 1
		bg.anchor_bottom = 1
		bg.margin_right += LIST_ALTER_BG_MARGIN_RIGHT
		lb_no.add_child(bg)
	current_add_white_bg = !current_add_white_bg

func clear():
	for i in data_vbox_no.get_children():
		i.queue_free()
	for i in data_vbox_name.get_children():
		i.queue_free()
	for i in data_vbox_difficulty.get_children():
		i.queue_free()
	for i in data_vbox_score.get_children():
		i.queue_free()

func reset_scroll():
	scroll_container.scroll_vertical = 0

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_GameLogDetailPopup_about_to_show() -> void:
	reset_scroll()

func _on_HitboxButton_pressed() -> void:
	hide()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------

