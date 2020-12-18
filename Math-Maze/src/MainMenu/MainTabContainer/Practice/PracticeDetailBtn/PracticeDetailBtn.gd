# PracticeDetailBtn (for Practice menu)

extends Button

class_name PracticeDetailBtn

"""
	No description available. Please make a request on GitHub issue tracker.
"""

#-------------------------------------------------
#      Sub-Classes
#-------------------------------------------------

#-------------------------------------------------
#      Signals
#-------------------------------------------------

signal info_pressed(stage_data)

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const COLOR_NORMAL = Color.white
const COLOR_CHECKED = Color("c0ffc0")

const BADGE_PREVIEW_TEXTURE = preload("res://Src/Scene/MainMenu/MainTabContainer/Practice/PracticeDetailBtn/BadgePreviewTexture.tscn")

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var preview_texture = $HBox/PreviewTexture
onready var stage_name_label = $HBox/DetailVBox/StageName
onready var mode_name_label = $HBox/DetailVBox/ModeName
onready var badge_hbox = $HBox/DetailVBox/BadgeHBox


var checked : bool
var stage_data : GameDBStageData

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	_update_ui()

func _pressed() -> void:
	checked = !checked
	_update_ui()

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func set_preview_texture(tex : StreamTexture):
	preview_texture.texture = tex
	_update_ui()

func set_stage_name(val : String):
	stage_name_label.text = val
	_update_ui()

func set_mode_name(val : String):
	mode_name_label.text = val
	_update_ui()

func set_checked(set : bool):
	checked = set
	_update_ui()

func initate_badges():
	for i in stage_data.stage_badges.size():
		var _badge = BADGE_PREVIEW_TEXTURE.instance()
		badge_hbox.add_child(_badge)
		_badge.texture = stage_data.get_badge_icon(i)

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_DetailBtn_pressed() -> void:
	emit_signal("info_pressed", stage_data)

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _update_ui():
	$Checkbox.visible = checked
	
	if checked:
		self_modulate = COLOR_CHECKED
	else:
		self_modulate = COLOR_NORMAL

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
