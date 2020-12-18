# MainMenu/MainTabContainer/Main (Tabs)

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

signal play_btn_pressed

signal player_stats_btn_pressed

signal game_log_btn_pressed

signal setting_btn_pressed

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

func _on_PlayButton_pressed() -> void:
	emit_signal("play_btn_pressed")

func _on_StatButton_pressed() -> void:
	emit_signal("player_stats_btn_pressed")

func _on_GameLogButton_pressed() -> void:
	emit_signal("game_log_btn_pressed")

func _on_SettingButton_pressed() -> void:
	emit_signal("setting_btn_pressed")

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
