extends Control

var text = 'ooo'
var chars_entered = 0
var text2show = ""
var errors = 0
var time_start = 0
	
func _process(delta):
	var sprite = get_node("VBoxContainer/TextureRect2/Control/Sprite2D")
	if Keyboard.key_dict.has(text[chars_entered]):
		var pos = Keyboard.key_dict[text[chars_entered]]
		sprite.position = pos
	else: 
		print("symbol <" + text[chars_entered] + "> not found")
		
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed:
			if event.keycode == KEY_ESCAPE:
				Scenes.hide_test()

			if char(event.unicode) == text[chars_entered]:
				get_node("KeySound").play()
				chars_entered += 1
				
				if chars_entered == 1:
					time_start = Time.get_ticks_msec()
				
				text2show = "[wave amp=50 freq=2][u][color=#134233]" + text.substr(0,chars_entered) + \
					"[/color][/u][/wave]" + \
					text.substr(chars_entered, text.length()-chars_entered)
				get_node("VBoxContainer/MarginContainer/Text").text = text2show
				
				if chars_entered >= text.length()-1:
					
					var time = Time.get_ticks_msec() - time_start
					var speed = text.length()*60*1000/time
					get_node("Result/MarginContainer/VBoxContainer/ResultSpeed").text = "Total speed = " + str(speed) + \
						" chars per minute"
					
					get_node("Result").visible = true
					get_node("WinSound").play()
			else:
				if Keyboard.key_dict.has(char(event.unicode)):
					get_node("ErrorSound").play()
					errors += 1
					var errors = 100*errors/text.length()
					get_node("Result/MarginContainer/VBoxContainer/ResultErrors").text = "Total error rate = " + str(errors)+ \
							"%"

func select_text(file_name):
	text = (FileAccess.open(file_name, FileAccess.READ).get_as_text())
	get_node("VBoxContainer/MarginContainer/Text").text = text
	get_node("MarginContainerSelect").visible = false
	get_node("VBoxContainer/MarginContainer/Text").visible = true	

func _on_level_select_easy_pressed():
	select_text("res://texts/text1.txt")
	
func _on_level_select_normal_pressed():
	select_text("res://texts/text2.txt")

func _on_level_select_hard_pressed():
	select_text("res://texts/text3.txt")
