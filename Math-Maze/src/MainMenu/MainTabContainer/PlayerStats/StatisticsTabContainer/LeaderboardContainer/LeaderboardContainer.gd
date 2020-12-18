# LeaderboardContainer (PlayerStats)

extends MarginContainer

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

onready var no_data_vbox = $VBox/ScrollContainer/HBox/NoVBox/DataVBox
onready var name_data_vbox = $VBox/ScrollContainer/HBox/NameVBox/DataVBox
onready var score_data_vbox = $VBox/ScrollContainer/HBox/ScoreVBox/DataVBox

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

func clear_list():
	for i in no_data_vbox.get_child_count():
		if i == 0:
			continue # Since the first child will always be a ColorPaletteSetter
		
		no_data_vbox.get_child(i).queue_free()
		name_data_vbox.get_child(i).queue_free()
		score_data_vbox.get_child(i).queue_free()

func add(pname : String, score : int):
	var no_label := Label.new()
	no_label.text = str(no_data_vbox.get_child_count())
	
	var name_label := Label.new()
	name_label.text = pname
	
	var score_label := Label.new()
	score_label.text = DigitFormatter.get_text(score)
	
	no_data_vbox.add_child(no_label)
	name_data_vbox.add_child(name_label)
	score_data_vbox.add_child(score_label)
	
	# Add white bg and await for the next two
	if no_data_vbox.get_child_count() % 2 == 0:
		var bg = ColorRect.new()
		bg.color = LIST_ALTER_BG_COLOR
		bg.show_behind_parent = true
		bg.anchor_right = 1
		bg.anchor_bottom = 1
		bg.margin_right += LIST_ALTER_BG_MARGIN_RIGHT
		no_label.add_child(bg)

#-------------------------------------------------
#      Connections
#-------------------------------------------------

#-------------------------------------------------
#      Private Methods
#-------------------------------------------------

#-------------------------------------------------
#      Setters & Getters
#-------------------------------------------------
