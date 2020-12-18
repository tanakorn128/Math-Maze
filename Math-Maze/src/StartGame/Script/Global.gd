extends Node
var speed = 15000
var VsPlayer
var Correct = "Null"
var showdialog1
var showdialog2 
var dialogbox = true
var path = "res://assets/story/chapter1/story2.json";
var story2 = load_json()
var Shot = load_shot()
func _process(delta):
	showdialog1 = load_dialog()["showdialog1"]
	showdialog2 = load_dialog()["showdialog2"]
	pass


func load_dialog():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass("res://assets/story/chapter1/showdialog.json",file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;

func load_json():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass(path,file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;
	
func load_shot():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass("res://assets/story/chapter1/Shot.json",file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;
