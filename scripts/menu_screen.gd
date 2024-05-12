extends Control


func _ready():
	await get_tree().create_timer(2).timeout 
	get_node("Sprite2D").visible = true
	await get_tree().create_timer(5).timeout 
	get_node("MarginContainer").visible = true	
	get_node("Sprite2D").visible = false	


func _on_credits_menubutton_pressed():
	Scenes.show_credits()

func _on_help_menubutton_pressed():
	Scenes.show_help()

func _on_test_menubutton_pressed():
	Scenes.show_test()
	
func _on_quit_menubutton_pressed():
	get_tree().quit() # Replace with function body.
