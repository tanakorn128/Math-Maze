extends Control
onready var health_Bar = $"Health Bar"
onready var update_Weet = $Tween

var HP
func _ready():
	var Name = Load_Data_Player()
	get_node("Name").text = Name.Name	
	
func _process(delta):
	HP = Load_Data_Player()
	$"Health Bar".value = int(HP.HP)
	pass
func _on_health_update(health):
	health_Bar .value = health
	update_Weet.interpolate_property(health_Bar, "value",
		health_Bar.value, health, 0.4,
		Tween.TRANS_SINE, Tween.EASE_IN_OUT,0.4)
	update_Weet.start()


func Load_Data_Player():
	var dictTemp;
	var file = File.new();
	var path = "res://assets/Player/Player.json";
	file.open(path,file.READ);
	var json = file.get_as_text();
	var json_result = JSON.parse(json)
	dictTemp = json_result.result;
	file.close()
	return dictTemp;



