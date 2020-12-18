extends Node2D
var start_game = false
var numshot = 2
var SpaceBar = true

var shot={
	"shot2": "!!!...",
	"shot3": "ยินดีต้อนรับสู่โลกของคณิตศาสตร์ ในโลกแห่งนี้ทุกอย่างล้วนแต่ตัดสินกันด้วยคณิตศาสตร์",
	"shot4": "การต่อสู้ก็เช่นกัน ผู้ที่สามารถทำโจทย์ได้มากกว่าก็จะเป็นผู้ชนะไป",
	"shot5": "เอาหล่ะสำหรับการครบคุมนั้น เราจะใช้ปุ่ม WASD ในการเคลื่อนที่ของตัวละคร Space bar ใช้ในการตอบตกลงต่างๆ และใช้การคลิกเมาย์ซ้ายในการเลือกตอบคำถาม",
	"shot6": "เป็นไงควบคุมไม่ยากเลยใช่ไหมหล่ะ ฮ่าๆ เอาหล่ะมาดูในส่วนของเนื้อเรื่องบ้าง",
	"shot7": "เกอราชกับสงครามโลกคณิตศาสตร์นั้นมีเนื้อเรื่องทั้งหมด 16 chapter",
	"shot8": "โดยในแต่ละ chapter จะมีภารกิจที่แตกต่างกันออกไป",
	"shot9": "จะต้องทำการเคลียร์ภารกิจทั้งหมด เพื่อที่จะปลดล็อค chapter ถัดไป",
	"shot10": "และการบันทึกเกมนั้น สามารถบันทึกเกมได้ที่ตู้จดหมายประจำแต่ละ chapter ",
	"shot11": "ฮิๆ ข้ารู้ว่าเจ้าพร้อมแล้ว",
	"shot12": "มาจบสงครามโลกคณิตศาสตร์นี้ด้วยกันเถอะ",
	"shot13": "CH1 ช่างตัดไม้ กับ ปีศาจ (จำนวนนับ และการบวก การลบ การคูณ การหารจำนวนนับ)",
	"shot14": "ภารกิจ : ตัดต้นไม้ขนาดใหญ่ 4 ต้นที่กระจัดกระจายอยู่ภายในป่า (TIP สามารอ่านป้ายในป่าเพื่อนำทางไปสู่ต้นไม้ได้)",
	"shot15": "ตัดต้นไม้ต้นที่ 1 ???",
	"shot16": "ตัดต้นไม้ต้นที่ 2 ???",
	"shot17": "ตัดต้นไม้ต้นที่ 3 ???",
	"shot18": "ตัดต้นไม้ต้นที่ 4 ???",
	"shot19": "เกอราช : ปีศาจ!! มาได้ยังไง ทำไมมาอยู่ที่นี่ได้" ,
	"shot20": "ปีศาจ : ????????????????????",
	"shot21": "เกอราช : อะไร เจ้าพูดอะไร ข้าฟังไม่รู้เรื่องเลย เอ๋! เดี๋ยว! เจ้าจะเข้ามาทำไม อย่า อย่า อย่าเข้ามานะ",
	"shot22": "ปีศาจ : ????????????????????",
	"shot23": "เกอราช : เกือบไปแล้ว ปีศาจนี่อันตรายจริงๆ ทำไมมีปีศาจอยู่ในป่าตอนใต้แบบนี้ได้นะ",
	"shot24": "เกอราช : หืม! กลิ่นนี้มัน ไฟไหม้! แต่เดี๋ยว มันมาจากทางบ้านข้า",
	"shot25": "ภารกิจ : กลับไปยังบ้าน เพื่อตรวจสอบสภาพของบ้านและที่มาของกลิ่นไหม้ (TIP สามารถตรวจสอบสิ่งต่างๆโดยการพูดคุยกับสิ่งนั้น)",
	"shot26": "เกอราช : นี่มันเกิดอะไรขึ้นกับบ้านของข้า ทำไมมันถึงไหม้ได้",
	"shot27": "เกอราช : ปีศาจ ต้องเป็นฝีมือของปีศาจเมื่อกี้แน่ๆ แต่มันมาอยู่ที่ป่าแห่งนี้ได้ยังไง ที่นี่ไกลจากเทือกเขาพลัมมาก อีกอย่างพวกมันก็ไม่น่าจะข้ามเทือกเขาพลัมมาได้",
	"shot28": "เกอราช : นี่มันเกิดอะไรขึ้นกันแน่!",
	"shot29": "เกอราช : ใจเย็นก่อน การที่ปีศาจจะมาที่ป่าแห่งนี้ได้ต้องผ่านป้อมปราการ และหมู่บ้านตอนใต้ ก่อน ข้าว่าต้องมีอะไรเกิดขึ้นที่หมู่บ้านแน่ๆ ข้าต้องรีบไปที่หมู่บ้าน!",
	"shot30": "ภารกิจ : เดินทางไปยังหมู่บ้านตอนใต้(TIP หมู่บ้านตอนใต้อยู่ทางทิศตะวันออกของบ้านเกอราช)",
	"shot31": "ป้าย : ทางไปหมู่บ้านตอนใต้",
	}
var speed = 15000;
var TempSpeed = 15000
var loadsave;
var shot13 = false;
var shot14 = false;
var closeshot13 = false
var closeshot14 = false
var hp
signal DialogBoxTeee1
func _ready():
	loadsave = get_node("/root/SaveGame")
	var DialoBox = get_tree().get_root().find_node("DialoBox",true,false)
	var DialogBox2 = get_tree().get_root().find_node("DialogBox2",true,false)
	var DialogBox3 = get_tree().get_root().find_node("DialogBox3",true,false)
	var Trees = get_tree().get_root().find_node("Scene3",true,false)
	DialoBox.connect("End",self,"Enddialog")
	DialogBox2.connect("End",self,"Enddialog2")
	DialogBox3.connect("End",self,"Enddialog3")
	Trees.connect("Tree1",self,"Tree1")
	Trees.connect("Tree2",self,"Tree2")
	Trees.connect("Tree3",self,"Tree3")
	Trees.connect("Tree4",self,"Tree4")
	$Scene3.show()
	$DialogBox2.hide()
	$DialogBox3.hide()
	loadsave.Save_json()
	if loadsave.Data["StartGame"] == "NotComplate":
		start_game = true
		StartGame()
	
	
	
func _process(delta):
	var Global = get_node("/root/Global")
	Global.speed=speed
	pass

func Enddialog():
	SpaceBar = true
	
func Enddialog2():
	if shot13:
		closeshot13 = true
func Enddialog3():
	if shot14:
		closeshot14 = true
func _input(event):
	if event.as_text() == "Space"and start_game and SpaceBar:
		StartGame()
		
	if event.as_text() == "Space" and closeshot13 and start_game:
		$DialogBox2.hide()
		StartGame3()
	if event.as_text() == "Space" and closeshot14 and start_game:
		$DialogBox3.hide()
		loadsave.dictionary["StartGame"] = "Complate"
		loadsave.Save_json()
		print("Save")
		speed = TempSpeed
	pass
func StartGame():
	var StringShot = str(numshot)
	var Data = str("shot"+StringShot)
	if start_game and numshot < 13 and start_game:
		$DialoBox.show()
		$DialoBox/Text.text= shot[Data]
		numshot += 1
		$DialoBox/Text/AnimationPlayer.play("Present_Visible")
		SpaceBar = false
		speed = 0
	else:
		$DialoBox.hide()
		numshot += 1
		speed = TempSpeed
		StartGame2()
		
func StartGame2():
	speed = 0
	$DialogBox2.show()
	$DialogBox2.numshot = 1
	$DialogBox2.Shot["1"] = shot.shot13
	$DialogBox2.print_dialog()
	shot13 = true
	pass
func StartGame3():
	$DialogBox3.show()
	$DialogBox3.numshot = 1
	$DialogBox3.Shot["1"] = shot.shot14
	$DialogBox3.print_dialog()
	shot14 =true
	pass

