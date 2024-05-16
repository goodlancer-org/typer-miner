extends Node

var key_dict = {}

func load_buttons():
	var file = FileAccess.open("res://texts/keyboard.txt", FileAccess.READ)
	
	while not file.eof_reached(): 
		var line = file.get_line()
		var values = line.split("^")
		if values.size() < 3:
			break
		key_dict[values[0]] = Vector2(int(values[1]),int(values[2]))
  
func _ready():
	load_buttons()
