# MainMenu/MainTabContainer/GameMode (Tabs)

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

signal close_btn_pressed

signal normal_mode_btn_pressed

signal practice_btn_pressed

#-------------------------------------------------
#      Constants
#-------------------------------------------------

#-------------------------------------------------
#      Properties
#-------------------------------------------------

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

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_NormalButton_pressed() -> void:
	emit_signal("normal_mode_btn_pressed")

func _on_PracticeButton_pressed() -> void:
	emit_signal("practice_btn_pressed")

func _on_CloseButton_pressed() -> void:
	emit_signal("close_btn_pressed")

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------