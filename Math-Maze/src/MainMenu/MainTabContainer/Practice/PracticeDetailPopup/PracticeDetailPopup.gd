# PracticeDetailPopup

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

const BADGE_DATA = preload("res://Src/Scene/MainMenu/MainTabContainer/Practice/PracticeDetailPopup/BadgeData/BadgeData.tscn")

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var stage_name_label = $Control/MarginContainer/VBox/ContentHBox/VBox/StageNameLabel
onready var mode_name_label = $Control/MarginContainer/VBox/ContentHBox/VBox/StageNameLabel/ModeNameLabel
onready var preview_texture = $Control/MarginContainer/VBox/ContentHBox/VBox/PreviewTexture
onready var badge_instance_box = $Control/MarginContainer/VBox/ContentHBox/VBox/LegendVBox/ScrollContainer/Hbox/InstanceVBox
onready var puzzle_hint_desc = $Control/MarginContainer/VBox/ContentHBox/ScrollContainer/DescContentVBox/PuzzleHintDesc
onready var how_to_play_desc = $Control/MarginContainer/VBox/ContentHBox/ScrollContainer/DescContentVBox/HowToPlayDesc
onready var condition_desc = $Control/MarginContainer/VBox/ContentHBox/ScrollContainer/DescContentVBox/ConditionDesc
onready var difficulty_desc = $Control/MarginContainer/VBox/ContentHBox/ScrollContainer/DescContentVBox/DifficultyDesc


var stage_data : GameDBStageData

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

func set_from_stage_data(stg_data : GameDBStageData):
	stage_data = stg_data
	
	stage_name_label.text = stage_data.stage_name
	mode_name_label.text = stage_data.get_mode_name()
	preview_texture.texture = stage_data.preview_texture
	puzzle_hint_desc.text = stage_data.info_puzzle_hint_desc
	how_to_play_desc.text = stage_data.info_how_to_play
	condition_desc.text = stage_data.info_condition
	difficulty_desc.text = stage_data.info_difficulty
	
	_instance_badges_data()

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_HitboxButton_pressed() -> void:
	hide()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _instance_badges_data():
	# Clear all child nodes
	for i in badge_instance_box.get_children():
		i.queue_free()
	
	# Instance badges from StageData
	for i in stage_data.stage_badges.size():
		var badge_data = BADGE_DATA.instance()
		badge_instance_box.add_child(badge_data)
		badge_data.set_badge_name(stage_data.get_badge_name(i))
		badge_data.set_icon(stage_data.get_badge_icon(i))

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
