# MainMenu/MainTabContainer/NameEntry (Tabs)

extends Tabs

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

signal done

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const ERR_NAME_EMPTY = "กรุณากรอกชื่อเล่น"

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var line_edit = $Vbox/LineEdit
onready var error_label = $Vbox/ErrorLabel

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	error_label.text = ""

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_SaveButton_pressed() -> void:
	if line_edit.text.empty():
		error_label.text = ERR_NAME_EMPTY
		return
	
	PlayerStat.player_name = line_edit.text
	GameSaver.save_game()
	
	emit_signal("done")

func _on_LineEdit_text_changed(new_text: String) -> void:
	error_label.text = ""

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
