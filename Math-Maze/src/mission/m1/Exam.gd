extends Node2D
var Exam;
var PrintAnswer;
var Answer
var global
export var min_exam = 0 
export var max_exam = 28
signal Correct
signal NotCorrect
var hp

func _ready():
	Exam = load_json()
	PrintAnswer = GetExam(random())
	GetOneExam()
	global = get_node("/root/Global")
	global.Correct = PrintAnswer.Correct

func _on_Button1_pressed():
	Answer = PrintAnswer.Answer1
	Correct()
	NotCorrect()
	pass # Replace with function body.


func _on_Button2_pressed():
	Answer = PrintAnswer.Answer2
	Correct()
	NotCorrect()
	pass # Replace with function body.


func _on_Button3_pressed():
	Answer = PrintAnswer.Answer3
	Correct()
	NotCorrect()
	pass # Replace with function body.


func _on_Button4_pressed():
	Answer = PrintAnswer.Answer4
	Correct()
	NotCorrect()

func RandomExam():
	var ran = random()
	PrintAnswer = GetExam(ran)
	GetOneExam()
	global.Correct = PrintAnswer.Correct
	pass

func random():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random_number = rng.randf_range(min_exam, max_exam)
	return random_number
	
	
func NotCorrect():
	if Correct():
		emit_signal("Correct")
		RandomExam()
	else:
		emit_signal("NotCorrect")
		$countdown.value = 100
		RandomExam()
	pass
func Correct():
	var Correct = null
	if Answer == PrintAnswer.Correct:
		 Correct = true
	else:
		 Correct = false
	return Correct

func GetOneExam():
	$Question.text = PrintAnswer.Question
	$Tabs/Button1/Label.text = PrintAnswer.Answer1
	$Tabs/Button2/Label.text = PrintAnswer.Answer2
	$Tabs/Button3/Label.text = PrintAnswer.Answer3
	$Tabs/Button4/Label.text = PrintAnswer.Answer4
	
func GetExam(value):
	var Data = Exam[value]
	var Exam = {
		"Question":"Q",
		"Answer1": "1",
		"Answer2": "2",
		"Answer3": "3",
		"Answer4": "4",
		"Correct": "C"
	}
	Exam["Question"] = Data["Question"]
	Exam["Answer1"] = Data["answer1"]
	Exam["Answer2"] = Data["answer2"]
	Exam["Answer3"] = Data["answer3"]
	Exam["Answer4"] = Data["answer4"]
	Exam["Correct"] = Data["Correct"]
	return Exam
	pass
	

func load_json():
	var dictTemp;
	var file = File.new();
	var path = "res://assets/Exam/chapter1.json";
	file.open(path,file.READ);
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;

