extends Node2D
var data = {
	"question": "Question",
	"pictures": "pictures",
	"answer1": "answer1",
	"answer2": "answer2",
	"answer3": "answer3",
	"answer4": "answer4",
	"correct": "answer1"
}
var rng = RandomNumberGenerator.new()
signal my_exam_hit
signal my_exam_lost
func _ready():
	updatedata()
	

func updatedata():
	var dicttemp = loaddata()
	var json = dicttemp[random()]
	data["question"] = json["Question"]
	data["answer1"] = json["answer1"]
	data["answer2"] = json["answer2"]
	data["answer3"] = json["answer3"]
	data["answer4"] = json["answer4"]
	data["correct"] = json["Correct"]
	
	#tabs
	$Control/Tabs/question/Label.text = data["question"]
	$Control/Tabs/answer1/Label.text = data["answer1"]
	$Control/Tabs/answer2/Label.text = data["answer2"]
	$Control/Tabs/answer3/Label.text = data["answer3"]
	$Control/Tabs/answer4/Label.text = data["answer4"]
	pass

func signal_enemy(signal_enemy):
	if signal_enemy == "hit": #hit
		updatedata()
		$Control/TextureProgress.value = 60
	if signal_enemy == "lost": #lost
		updatedata()
		$Control/TextureProgress.value = 60
	pass

func loaddata():
	var f = File.new()
	f.open("res://assets/exam/chapter1.json",File.READ)
	var result = f.get_as_text()
	var result_json = JSON.parse(result)
	var dicttemp = result_json.result
	f.close()
	return dicttemp
	pass

func random():
	rng.randomize()
	var random_number = rng.randf_range(0, 39)
	
	return int(random_number)
	pass

func check(answer,Correct):
	if answer == Correct:
		emit_signal("my_exam_hit")
		print("my_exam_hit")
		#queue_free()
		return "Hit"
	else:
		emit_signal("my_exam_lost")
		return "lose"

func _on_Timer_timeout():
	if $Control/TextureProgress.value > 0:
		$Control/TextureProgress.value -= 1
	else:
		print("timt out")
		updatedata()
		$Control/TextureProgress.value = 60
	pass # Replace with function body.


func _on_answer1_button_down():
	check(data.answer1,data.correct)
	pass # Replace with function body.


func _on_answer2_button_down():
	check(data.answer2,data.correct)
	pass # Replace with function body.


func _on_answer3_button_down():
	check(data.answer3,data.correct)
	pass # Replace with function body.


func _on_answer4_button_down():
	check(data.answer4,data.correct)
	pass # Replace with function body.
