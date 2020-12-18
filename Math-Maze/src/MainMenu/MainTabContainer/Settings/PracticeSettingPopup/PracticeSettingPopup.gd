# PracticeSettingPopup (for practice screen)

extends PopupPanel

class_name PracticeSettingPopup

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

enum Timers {
	LIMITED = 0,
	UNLIMITED = 1
}

enum Difficulties {
	AUTO = 0,
	EASY = 2,
	NORMAL = 3,
	HARD = 4,
	INTENSE = 5
}

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var timer_menu_button = $Control/MarginContainer/VBoxContainer/OptionsVBox/Timer/MenuButton
onready var life_menu_button = $Control/MarginContainer/VBoxContainer/OptionsVBox/Life/MenuButton
onready var diff_menu_button = $Control/MarginContainer/VBoxContainer/OptionsVBox/Difficulty/MenuButton

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	_init_timer_menu()
	_init_lives_menu()
	_init_difficulties_menu()
	_try_restore_previous_setting()

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func is_time_limited() -> bool:
	return timer_menu_button.selected == Timers.LIMITED

func is_difficulty_locked() -> bool:
	return diff_menu_button.selected != Difficulties.AUTO

func is_time_decay_locked() -> bool:
	return diff_menu_button.selected == Difficulties.HARD

func get_lives() -> int:
	return life_menu_button.selected + 1

func get_difficulty_selected_id() -> int:
	return diff_menu_button.selected

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_HitboxButton_pressed() -> void:
	hide()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

func _init_timer_menu():
	timer_menu_button.add_item("จำกัด", Timers.LIMITED)
	timer_menu_button.add_item("ไม่จำกัด", Timers.UNLIMITED)

func _init_lives_menu():
	life_menu_button.add_item("1")
	life_menu_button.add_item("2")
	life_menu_button.add_item("3")
	life_menu_button.add_item("4")
	life_menu_button.add_item("5")
	life_menu_button.add_item("6")
	life_menu_button.add_item("7")
	life_menu_button.add_item("8")
	life_menu_button.add_item("9")

func _init_difficulties_menu():
	diff_menu_button.add_item("ค่าตั้งต้น", Difficulties.AUTO)
	diff_menu_button.add_separator()
	diff_menu_button.add_item("ง่าย", Difficulties.EASY)
	diff_menu_button.add_item("ปานกลาง", Difficulties.NORMAL)
	diff_menu_button.add_item("ยาก", Difficulties.HARD)
	diff_menu_button.add_item("ยากขึ้นเรื่อยๆ", Difficulties.INTENSE)

# Restore settings after coming back from game over
func _try_restore_previous_setting():
	if GameMode.current_mode == GameMode.Mode.PRACTICE:
		timer_menu_button.selected = int(GameMode.practice.unlimited_time)
		life_menu_button.selected = GameMode.practice.starting_lives - 1
		diff_menu_button.selected = GameMode.practice.starting_difficulty_id
	else:
		life_menu_button.selected = 2

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
