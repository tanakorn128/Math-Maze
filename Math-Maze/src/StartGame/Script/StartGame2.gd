extends Node2D
var dictionary
var path = "res://assets/story/chapter1/shot2.json";
var Shot={
	"Shot1":"กาลครั้งหนึ่งนานมาแล้ว ณ โลกที่ทุกอย่างตัดสินกันด้วยคณิตศาสตร์", #shot1
	"Shot2":"ไม่ว่าจะเป็นการต่อสู้ การตัดต้นไม้ การทดสอบต่างๆ ล้วนแล้วแต่ต้องใช้คณิตศาสตร์ในการตัดสินทั้งสิ้น", #shot2
	"Shot3":"และสิ่งมีชีวิตที่มีความเฉลียวฉลาด และมีทักษะในการแก้โจทย์ปัญหาทางคณิตศาสตร์มากที่สุดก็คือมนุษย์", #shot3
	"Shot4":"ด้วยเหตุนี้เองมนุษย์จึงเป็นผู้ที่อยู่บนจุดสูงสุดของห่วงโซ่อาหารของสิ่งมีชีวิตทั้งหมดบนโลกใบนี้", #shot4
	"Shot5":"มนุษย์ได้ทำการรวมกลุ่ม ปกครองกันเอง และจัดตั้งเป็นอาณาจักรเออรี่ขึ้นมา", #shot5
	"Shot6":"ไม่เพียงเท่านั้น มนุษย์นั้นได้ทำการบุกเบิกพื้นที่ส่วนต่างๆของโลกใบนี้ และได้สร้างสิ่งก่อสร้างต่างๆไว้มากมายเช่น เมือง ป้อมปราการ หมู่บ้าน", #shot6
	"Shot7":"ยุคทองของมนุษย์ได้เริ่มต้นขึ้น", #shot7
	"Shot8":"มนุษย์บนโลกใบนี้ใช้ชีวิตอย่างสงบสุข มีชีวิตที่เรียบง่าย และใช้ชีวิตอย่างมีความสุขในทุกๆวัน", #shot8
	"Shot9":"และแล้วฝันร้ายของมนุษย์ก็ได้เริ่มต้นขึ้น", #shot9
	"Shot10":"มีสิ่งมีชีวิตที่ทรงพลังและมีความเฉลียวฉลาดเทียบเท่าหรือมากกว่ามนุษย์กำเนิดขึ้นบนโลก", #shot10
	"Shot11":"มนุษย์เรียกสิ่งมีชีวิตนั้นว่า “ปีศาจ”", #shot11
	"Shot12":"พวกมันมีศักยภาพร่างกายที่สูงกว่ามนุษย์ทั่วไป และที่สำคัญพวกมันมีความเฉลียวฉลาดและทางคณิตศาสตร์ที่สูงมาก", #shot12
	"Shot13":"ปีศาจนั้นต้องการที่จะยึดครองโลกนี้ไว้ภายใต้การปกครองของจอมปีศาจคาราฮานผู้โหดเหี้ยม", #shot13
	"Shot14":"จึงเกิดสงความในการแย่งชิงดินแดนกันระหว่างมนุษย์และปีศาจ", #shot14
	"Shot15":"ผลการต่อสู้คือ ฝั่งมนุษย์พ่ายแพ้ และเสียดินแดนครึ่งหนึ่งไป นั้นคือฝั่งตะวันออกทั้งหมด", #shot15
	"Shot16":"สงครามระหว่างมนุษย์กับปีศาจนั้นได้ดำเนินไปอย่างต่อเนื่อง โดยมีเทือกเขาพลัมขั้นกลางระหว่าง 2 ฝั่ง", #shot16
	"Shot17":"เทือกเขาพลัมเป็นเทือกเขาที่มีความสูงชันมาก ไม่ว่ามนุษย์หรือปีศาจก็ไม่สามารถข้ามภูเขาลูกนี้ไปได้", #shot17
	"Shot18":"จึงทำให้สงครามนั้นเกิดขึ้นในบริเวณช่องแคบพลัม มนุษย์และปีศาจต่างก็จัดกองทัพของตนมาต่อสู้กับอีกฝ่าย", #shot18
	"Shot19":"แต่ฝ่ายของมนุษย์นั้นเสียเปรียบเป็นอย่างมาก เนื่องจากปีศาจมีร่างกายที่แข็งแรงกว่า ทั้งยังมีสติปัญญาที่เทียบเท่าหรือสูงกว่ามนุษย์", #shot19
	"Shot20":"สงครามระหว่างมนุษย์กับปีศาจจะจบอย่างไร . . .", #shot20
	"Shot21":"กรุณาใส่ชื่อตัวละคร", #shot21
	"Shot22":"นี้คือเรื่องราวของเกอราชกับสงครามโลกคณิตศาสตร์ จากช่างตัดไม้ธรรมดาๆสู่การเป็นผู้จบสงครามโลกคณิตศาสตร์", #shot22
	"Shot23":"เกอราชนั้นเป็นเพียงช่างตัดไม้ธรรมดาที่อาศัยอยู่ในป่าของหมู่บ้านทางตอนใต้ เขาใช้ชีวิตอย่างมีความสุข และสงบสุขในป่าและธรรมชาติ", #shot23
	"Shot24":"และแล้วเกอราชก็ต้องพบเจอกับเหตุการณ์ที่เปลี่ยนแปลงชีวิตเขาไปตลอดกาล . . .", #shot24
	}
func _ready():
	
	$DialogBoxV3.send_dialogbox(1,25)
	dictionary = $DialogBoxV3.load_shot2()
	dictionary["1"] = Shot["Shot1"]
	dictionary["2"] = Shot["Shot2"]
	dictionary["3"] = Shot["Shot3"]
	dictionary["4"] = Shot["Shot4"]
	dictionary["5"] = Shot["Shot5"]
	dictionary["6"] = Shot["Shot6"]
	dictionary["7"] = Shot["Shot7"]
	dictionary["8"] = Shot["Shot8"]
	dictionary["9"] = Shot["Shot9"]
	dictionary["10"] = Shot["Shot10"]
	dictionary["11"] = Shot["Shot11"]
	dictionary["12"] = Shot["Shot12"]
	dictionary["13"] = Shot["Shot13"]
	dictionary["14"] = Shot["Shot14"]
	dictionary["15"] = Shot["Shot15"]
	dictionary["16"] = Shot["Shot16"]
	dictionary["17"] = Shot["Shot17"]
	dictionary["18"] = Shot["Shot18"]
	dictionary["19"] = Shot["Shot19"]
	dictionary["20"] = Shot["Shot20"]
	dictionary["21"] = Shot["Shot21"]
	dictionary["22"] = Shot["Shot22"]
	dictionary["23"] = Shot["Shot23"]
	dictionary["24"] = Shot["Shot24"]
	save_shot2()
func save_shot2():
	var save_game = File.new()
	save_game.open_encrypted_with_pass(path,File.WRITE, "mypass")
	var string_output = JSON.print(dictionary.duplicate(true)," ")
	save_game.store_string(string_output)
	save_game.close()
