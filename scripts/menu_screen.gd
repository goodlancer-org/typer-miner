extends Control

func _on_credits_menubutton_pressed():
	Scenes.show_credits()

func _on_help_menubutton_pressed():
	Scenes.show_help()

func _on_test_menubutton_pressed():
	Scenes.show_test()
	
func _on_quit_menubutton_pressed():
	get_tree().quit() # Replace with function body.
