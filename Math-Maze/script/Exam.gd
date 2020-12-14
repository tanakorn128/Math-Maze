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
		return "Hit"
	else:
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
	var x = check(data.answer1,data.correct)
	print(x)
	pass # Replace with function body.


func _on_answer2_button_down():
	var x = check(data.answer2,data.correct)
	print(x)
	pass # Replace with function body.


func _on_answer3_button_down():
	var x = check(data.answer3,data.correct)
	print(x)
	pass # Replace with function body.


func _on_answer4_button_down():
	var x = check(data.answer4,data.correct)
	print(x)
	pass # Replace with function body.
