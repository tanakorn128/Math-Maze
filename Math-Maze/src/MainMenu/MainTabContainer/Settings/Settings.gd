# MainMenu/MainTabContainer/Settings (Tabs)

extends Tabs

class_name MainMenuSettings

"""
	No description available. Please make a request on GitHub issue tracker.
"""

#-------------------------------------------------
#      Sub-Classes
#-------------------------------------------------

#-------------------------------------------------
#      Signals
#-------------------------------------------------

signal request_save_settings

signal close_btn_pressed

signal request_update_sfx_volume

signal request_update_bgm_volume

#-------------------------------------------------
#      Constants
#-------------------------------------------------

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var sfx_slider = $"TabContainer/เสียง/VBox/SoundVBox/HBoxContainer/SfxHSlider"
onready var sfx_percent_label = $"TabContainer/เสียง/VBox/SoundVBox/HBoxContainer/SfxPercentLabel"
onready var bgm_slider = $"TabContainer/เสียง/VBox/MusicVBox/HBoxContainer/BgmHSlider"
onready var bgm_percent_label = $"TabContainer/เสียง/VBox/MusicVBox/HBoxContainer/BgmPercentLabel"
onready var version_label = $VersionLabel
onready var sound_test = $SoundTest

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

func set_sfx_vol(dB : float):
	sfx_slider.value = dB

func set_bgm_vol(dB : float):
	bgm_slider.value = dB

func set_version_label(text):
	version_label.text = text

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_CreditLabel_meta_clicked(meta) -> void:
	OS.shell_open(meta)

func _on_CloseButton_pressed() -> void:
	emit_signal("request_save_settings")
	emit_signal("close_btn_pressed")

func _on_SfxHSlider_value_changed(value : float) -> void:
	if visible: # If the setting menu is currently active
		emit_signal("request_update_sfx_volume", value)
		
		if not sound_test.playing:
			sound_test.play()
	
	# Update percent label
	sfx_percent_label.text = str(round(((sfx_slider.value + 60) / (sfx_slider.max_value + 60)) * 100), "%")

func _on_BgmHSlider_value_changed(value : float) -> void:
	if visible: # If the setting menu is currently active
		emit_signal("request_update_bgm_volume", value)
	
	bgm_percent_label.text = str(round(((bgm_slider.value + 60) / (bgm_slider.max_value + 60)) * 100), "%")

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
