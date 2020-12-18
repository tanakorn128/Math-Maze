extends Node2D
var showdialog
var path = "res://assets/story/chapter1/shot2.json";
var path2 = "res://assets/story/chapter1/showdialog.json";
var dictionary={"1": "1","2": "2","3": "3","4": "4","5": "5","6": "5","7": "7","8": "8","9": "9","10": "10",
	"11": "11","12": "12","13": "13","14": "14","15": "15","16": "16","17": "17","18": "18","19": "19","20": "20",
	"21": "21","22": "22","23": "23","24": "24","25": "25","26": "26","27": "27","28": "28","29": "29","30": "30",
	"31": "31","32": "32","33": "33","34": "34","35": "35","36": "36","37": "37","38": "38","39": "39","40": "40",
	"41": "41","42": "42"
}
var dictionary2


#       showdialog  
#var showdialog1 "true" of "false"
#showdialog2 "true" of "false"
#end int

func _ready():
	#send_dialogbox(1,10)
	#save_showdialog()
	#print(load_showdialog())
	save_shot2()
	pass

func send_dialogbox(dialogbox,end):
	dictionary2 = load_showdialog()
	dictionary2["end"] = str(end)
	if dialogbox == 1:
		dictionary2["showdialog1"] = "true"
		pass
	if dialogbox == 2:
		dictionary2["showdialog2"] = "true"
	save_showdialog()
	pass
	




func save_showdialog():
	var save_game = File.new()
	save_game.open_encrypted_with_pass(path2,File.WRITE, "mypass")
	var string_output = JSON.print(dictionary2.duplicate(true)," ")
	save_game.store_string(string_output)
	save_game.close()

func load_showdialog():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass(path2,file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;

func load_shot2():
	var dictTemp;
	var file = File.new();
	file.open_encrypted_with_pass(path,file.READ, "mypass");
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;
	
func save_shot2():
	var save_game = File.new()
	save_game.open_encrypted_with_pass(path,File.WRITE, "mypass")
	var string_output = JSON.print(dictionary.duplicate(true)," ")
	save_game.store_string(string_output)
	save_game.close()
