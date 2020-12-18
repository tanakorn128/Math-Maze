# MainMenu/MainTabContainer

extends TabContainer

class_name MainTabContainer

"""
	No description available. Please make a request on GitHub issue tracker.
"""

#-------------------------------------------------
#      Sub-Classes
#-------------------------------------------------

#-------------------------------------------------
#      Signals
#-------------------------------------------------

signal normal_mode_selected

signal practice_mode_begin

signal request_save_settings

signal request_update_sfx_volume

signal request_update_bgm_volume

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const TAB_MAIN = 0
const TAB_STATS = 1
const TAB_GAME_LOG = 2
const TAB_GAME_MODE = 3
const TAB_SETTINGS = 4
const TAB_PRACTICE = 5
const TAB_WELCOME = 6
const TAB_NAME_ENTRY = 7

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var tabs_main = $Main
onready var tabs_player_stats : MainMenuPlayerStats = $PlayerStats
onready var tabs_game_log : MainMenuGameLog = $GameLog
onready var tabs_game_mode = $GameMode
onready var tabs_settings : MainMenuSettings = $Settings
onready var transit_anim = $TransitionAnim

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	_try_initial_tab()

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func show_stats():
	transit_anim.play("Entering")
	yield(transit_anim, "animation_finished")
	_switch_main_tab(TAB_STATS)
	transit_anim.play("Entered")

func show_game_log():
	transit_anim.play("Entering")
	yield(transit_anim, "animation_finished")
	_switch_main_tab(TAB_GAME_LOG)
	transit_anim.play("Entered")

func show_game_mode():
	transit_anim.play("Entering")
	yield(transit_anim, "animation_finished")
	_switch_main_tab(TAB_GAME_MODE)
	transit_anim.play("Entered")

func show_game_mode_from_practice():
	transit_anim.play("Shrinking")
	yield(transit_anim, "animation_finished")
	_switch_main_tab(TAB_GAME_MODE)
	transit_anim.play("Shrinked")

func show_settings():
	transit_anim.play("Entering")
	yield(transit_anim, "animation_finished")
	_switch_main_tab(TAB_SETTINGS)
	transit_anim.play("Entered")

func show_menu():
	transit_anim.play("Leaving")
	yield(transit_anim, "animation_finished")
	_switch_main_tab(TAB_MAIN)
	transit_anim.play("Left")

func show_practice():
	transit_anim.play("Growing")
	yield(transit_anim, "animation_finished")
	_switch_main_tab(TAB_PRACTICE)
	transit_anim.play("Growed")

func show_name_entry():
	transit_anim.play("Growing")
	yield(transit_anim, "animation_finished")
	_switch_main_tab(TAB_NAME_ENTRY)
	transit_anim.play("Growed")

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_Main_play_btn_pressed() -> void:
	show_game_mode()

func _on_Main_player_stats_btn_pressed() -> void:
	show_stats()

func _on_Main_game_log_btn_pressed() -> void:
	show_game_log()

func _on_Main_setting_btn_pressed() -> void:
	show_settings()

func _on_PlayerStats_close_btn_pressed() -> void:
	show_menu()

func _on_GameLog_close_btn_pressed() -> void:
	show_menu()

func _on_Settings_close_btn_pressed() -> void:
	show_menu()

func _on_GameMode_normal_mode_btn_pressed() -> void:
	emit_signal("normal_mode_selected")

func _on_GameMode_practice_btn_pressed() -> void:
	show_practice()

func _on_Practice_closed() -> void:
	show_game_mode_from_practice()

func _on_Practice_began() -> void:
	emit_signal("practice_mode_begin")

func _on_GameMode_close_btn_pressed() -> void:
	show_menu()

func _on_Settings_request_save_settings() -> void:
	emit_signal("request_save_settings")

func _on_Settings_request_update_bgm_volume(value : float) -> void:
	emit_signal("request_update_bgm_volume", value)

func _on_Settings_request_update_sfx_volume(value : float) -> void:
	emit_signal("request_update_sfx_volume", value)

func _on_Welcome_skipped() -> void:
	show_name_entry()

func _on_NameEntry_done() -> void:
	show_menu()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _switch_main_tab(tab_idx):
	current_tab = tab_idx

func _try_initial_tab():
	if GameMode.current_mode == GameMode.Mode.PRACTICE:
		_switch_main_tab(TAB_PRACTICE)
	elif PlayerStat.player_name.empty():
		_switch_main_tab(TAB_WELCOME)
	
	# Default tab idx is 0, no need to create else condt. here

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
