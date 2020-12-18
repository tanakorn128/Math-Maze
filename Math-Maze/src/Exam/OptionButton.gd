extends OptionButton
func _ready():
	self.add_item("chater1",0)
	self.add_item("chater2",1)
	self.add_item("chater3",2)
	self.add_item("chater4",3)
	self.add_item("chater5",4)
	self.add_item("chater6",5)
	self.add_item("chater7",6)
	self.add_item("chater8",7)
	self.add_item("chater9",8)
	self.add_item("chater10",9)
	self.add_item("chater11",10)
	self.add_item("chater12",11)
	self.add_item("chater13",12)
	self.add_item("chater14",13)
	self.add_item("chater15",14)
	


func _on_OptionButton_pressed():

	pass # Replace with function body.





func _on_OptionButton_item_selected(index):
	var data = self.get_item_text(index)
	if(data == "chater2"):
		get_tree().change_scene("res://src/Exam/chater2/chater2.tscn")
	pass # Replace with function body.
