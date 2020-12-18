
etends Control
var dictionary = {}
var couter = 0
var remove = "exam1"
var check_exam = true
var chater = 1
func other_dictionary():
	var other_dictionary = {
	"exam" + str(exam_Id()):{"Id": couter,"question": str($question.text),
	"answer1": str($answer1.text),
	"answer2": str($answer2.text),
	"answer3": str($answer3.text),
	"answer4": str($answer4.text),
	"Correct": "",
	"image": ""}}
	return other_dictionary #return ไปใช้ merge_dictionary
	
#-----------------------------------------------------------------
#-----------------------------------------------------------------
#create data 
func _on_create_json_pressed():
	dictionary = {
	"exam" + str(exam_Id()):{"Id": couter,"question": "",
	"answer1": "",
	"answer2": "",
	"answer3": "",
	"answer4": "",
	"Correct": "",
	"image": ""}}
	save_json()


# save file json
func save_json():
	var save_game = File.new()
	save_game.open_encrypted_with_pass("res://./exam/chater1.json",File.WRITE, "mypass")
	var string_output = JSON.print(dictionary.duplicate(true)," ")
	save_game.store_string(string_output)
	save_game.close()

#load json
func _on_load_json_pressed():
	$Panel/RichTextLabel.text = str(load_json())
	load_option()
	$exam.clear()
	check_exam = true
	pass # Replace with function body.
	
	#update
func _on_update_dictionary_pressed():
	update_Dictionary(load_json(),"exam", "question","Ect")
	save_json()
	pass # Replace with function body.


func _on_merge_dictionary_pressed():
	merge_Dictionary(other_dictionary(),dictionary)
	$exam.clear()
	check_exam = true
	save_json()

	pass # Replace with function body.
func _on_delete_pressed():
	#remove_dictionary(remove)
	#$exam.clear()
	#check_exam = true
	pass # Replace with function body.
	
	#-----------------------------------------------------------------
	#-----------------------------------------------------------------
	
func load_json():
	var dictTemp;
	var file = File.new();
	var path = "res://./exam/chater1.json";
	file.open_encrypted_with_pass(path,file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;
	
func load_option():
	var dict = load_json().keys()
	var size = load_json().keys().size()
	var search = load_json()
	var id = $exam.get_selected_id()
	if (size > 0):
		var question = str(search[dict[id]]["question"])
		var answer1 = str(search[dict[id]]["answer1"])
		var answer2 = str(search[dict[id]]["answer2"])
		var answer3 = str(search[dict[id]]["answer3"])
		var answer4 = str(search[dict[id]]["answer4"])
		$question.text = question
		$answer1.text = answer1
		$answer2.text = answer2
		$answer3.text = answer3
		$answer4.text = answer4
	else:
		print("Null")

	pass


func update_Dictionary(dictionary, key, subkey, value):
	for k in dictionary:
		if (str(key) == str(k)): # key ที่ส่งมามี อยู่ใน dictionary
			for sk in dictionary[k]:
				if(subkey == str(sk)): #ถ้า subkey มีอยู่ใน  dictionary
					dictionary[k][sk] = 123; #update data
	pass;

	
	
func merge_Dictionary(source, target):
	for key in source:
		if target.has(key): #true or false
			var tv = target[key]
			if typeof(tv) == TYPE_DICTIONARY:
				merge_Dictionary(tv,source[key]) #merge
				exam_Id()
			else:
				target[key] = source[key]
		else:
			target[key] = source[key]

func exam_Id():
	if(load_json().empty()):
		couter = 0
	couter +=1
	load_json().empty()
	
		
	return couter # return ไปใช้ add data
	pass
	
func remove_dictionary(dictionary_remove):
	dictionary.erase(str(dictionary_remove))
	save_json()
	pass

#-----------------------------------------------------------------
#-----------------------------------------------------------------
# option button
func _on_exam_pressed():
	exam_option()
	pass # Replace with function body.
	

func exam_option():
	var couter = load_json().keys().size() #size of dictionary
	var option = load_json().keys() #key of dictionary
	var PopupMenu_exam = $exam.get_popup()
	if (check_exam): #check button clear
		for k in couter:
			$exam.add_item(str(load_json()[option[k]]["Id"]),k)
	check_exam = false
	pass # Replace with function body.
	

