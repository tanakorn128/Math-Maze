extends Node2D
signal End
var Shot
var numshot = 1
var next = true
var number
var path = "res://assets/story/chapter1/shot2.json";
func _ready():
	numshot = 1
	Shot =load_json()
	#print_dialog()
	
	
func _process(delta):
	Shot =load_json()
	pass
	
func load_json():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass(path,file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;
	
func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("End")
	next = true
	pass # Replace with function body.
	
func _input(event):
	if event.as_text() == "Space" and next:
		print_dialog()


func print_dialog():
	var StringShot = str(numshot)
	var Data = str(StringShot)
	if numshot < 41:
		get_node("Text").text = Shot[Data]
		$Text/AnimationPlayer.play("Present_Visible")
		numshot+=1
		next = false
	
