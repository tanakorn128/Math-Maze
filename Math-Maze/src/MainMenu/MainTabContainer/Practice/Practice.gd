# MainMenu/MainTabContainer/Practice (Tabs)

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

signal closed
signal began

#-------------------------------------------------
#      Constants
#-------------------------------------------------

const PRACTICE_DETAIL_BTN = preload("res://Src/Scene/MainMenu/MainTabContainer/Practice/PracticeDetailBtn/PracticeDetailBtn.tscn")

const TEXT_SELECT_ALL = "เลือกทั้งหมด"
const TEXT_UNSELECT_ALL = "ไม่เลือก"

#-------------------------------------------------
#      Properties
#-------------------------------------------------

onready var grid_container = $Control/VBox/ScrollMarginVBox/ScrollContainer/HBox/PracticeBtnInstancesGrid
onready var total_selected_label = $Control/VBox/OptionHBox/TotalSelectLabel
onready var selection_label = $Control/VBox/OptionHBox/Selection
onready var play_btn = $Control/VBox/OptionHBox/Play/PlayButton
onready var play_btn_color_pal = $Control/VBox/OptionHBox/Play/PlayButton/ColorPaletteSetter
onready var practice_setting_popup = $PracticeSettingPopup
onready var practice_detail_popup = $PracticeDetailPopup

#-------------------------------------------------
#      Notifications
#-------------------------------------------------

func _ready() -> void:
	_instance_detail_buttons()
	_update_total_selected()

#-------------------------------------------------
#      Virtual Methods
#-------------------------------------------------

#-------------------------------------------------
#      Override Methods
#-------------------------------------------------

#-------------------------------------------------
#      Public Methods
#-------------------------------------------------

func selection_all_toggle():
	var do_deselect_all : bool = has_one_checked()
	
	for i in grid_container.get_children():
		if do_deselect_all:
			i.set_checked(false)
		else:
			i.set_checked(true)
	
	_update_total_selected()

func deselect_all():
	for i in grid_container.get_children():
		i.set_checked(false)

func reset_scroll():
	$Control/VBox/ScrollMarginVBox/ScrollContainer.scroll_vertical = 0

func apply_practice():
	GameMode.practice.unlimited_time = not practice_setting_popup.is_time_limited()
	GameMode.practice.locked_difficulty = practice_setting_popup.is_difficulty_locked()
	GameMode.practice.locked_time_decay = practice_setting_popup.is_time_decay_locked()
	
	# Fetch scene paths from every selected button
	var scene_paths : Array
	for i in grid_container.get_children():
		i = i as PracticeDetailBtn
		
		if i.checked:
			scene_paths.append(i.stage_data.stage_scene_path)
	
	match practice_setting_popup.get_difficulty_selected_id():
		PracticeSettingPopup.Difficulties.AUTO:
			GlobalDifficulty.current_difficulty_level = GlobalDifficulty.Difficulty.EASY
		PracticeSettingPopup.Difficulties.EASY:
			GlobalDifficulty.current_difficulty_level = GlobalDifficulty.Difficulty.EASY
		PracticeSettingPopup.Difficulties.NORMAL:
			GlobalDifficulty.current_difficulty_level = GlobalDifficulty.Difficulty.NORMAL
		PracticeSettingPopup.Difficulties.HARD:
			GlobalDifficulty.current_difficulty_level = GlobalDifficulty.Difficulty.HARD
		PracticeSettingPopup.Difficulties.INTENSE:
			GlobalDifficulty.current_difficulty_level = GlobalDifficulty.Difficulty.HARD
		_:
			pass
	
	GameMode.practice.starting_lives = practice_setting_popup.get_lives()
	Life.remaining = practice_setting_popup.get_lives()
	GameMode.practice.starting_difficulty_id = practice_setting_popup.diff_menu_button.selected
	PuzzlePool.init_practice_scenes(scene_paths)

func popup_practice_settings():
	practice_setting_popup.popup_centered()
	$DimColorRect.dim()

# Returns true if at least one button is checked
func has_one_checked() -> bool:
	for i in grid_container.get_children():
		if i.checked:
			return true
	
	return false

#-------------------------------------------------
#      Connections
#-------------------------------------------------

func _on_OptionButton_pressed() -> void:
	popup_practice_settings()

func _on_PracticeSettingPopup_popup_hide() -> void:
	$DimColorRect.brightern()

func _on_PracticeDetailPopup_popup_hide() -> void:
	$DimColorRect.brightern()

func _on_SelectionButton_pressed() -> void:
	selection_all_toggle()

func _on_CloseButton_pressed() -> void:
	emit_signal("closed")

func _on_PlayButton_pressed() -> void:
	emit_signal("began")
	apply_practice()

func _on_Practice_hide() -> void:
	reset_scroll()
	deselect_all()

# Connect from _instance_detail_buttons()
func _on_detail_button_pressed():
	_update_total_selected()

# Connect from _instance_detail_buttons()
func _on_PracticeDetailBtn_info_pressed(stage_data : GameDBStageData):
	practice_detail_popup.set_from_stage_data(stage_data)
	practice_detail_popup.popup_centered()
	$DimColorRect.dim()

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

# Create stage detail buttons for each available stages
func _instance_detail_buttons():
	for i in GlobalConstant.STAGES_DATA:
		i = i as GameDBStageData
		
		var btn = PRACTICE_DETAIL_BTN.instance()
		grid_container.add_child(btn)
		btn.stage_data = i
		btn.set_preview_texture(i.preview_texture)
		btn.set_stage_name(i.stage_name)
		btn.set_mode_name(i.get_mode_name())
		btn.initate_badges()
		btn.connect("pressed", self, "_on_detail_button_pressed")
		btn.connect("info_pressed", self, "_on_PracticeDetailBtn_info_pressed")

func _update_total_selected():
	var _total_checked : int
	var _deselect_capable : bool
	
	for i in grid_container.get_children():
		if i.checked:
			_total_checked += 1
			_deselect_capable = true
	
	total_selected_label.text = str(_total_checked, "/", grid_container.get_child_count())
	
	if _deselect_capable:
		selection_label.text = TEXT_UNSELECT_ALL
	else:
		selection_label.text = TEXT_SELECT_ALL
	
	_update_play_button()

func _update_play_button():
	var disabled = not has_one_checked()
	play_btn.disabled = disabled
	
	if disabled:
		play_btn_color_pal.palette_color = ColorPalette.Presets.NON_FOCUS
	else:
		play_btn_color_pal.palette_color = ColorPalette.Presets.SUCCESS

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
