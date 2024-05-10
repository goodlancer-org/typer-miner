extends Node

const menu_screen = preload("res://scenes/menu_screen.tscn")
const credits_screen = preload("res://scenes/credits_screen.tscn")
const test_screen = preload("res://scenes/test_screen.tscn")
const help_screen = preload("res://scenes/help_screen.tscn")


func show_scene(scene):
	get_node("/root/Node/menu_screen").queue_free()
	
	var node = scene.instantiate()
	get_node("/root/Node").add_child(node)
	
	
func hide_scene(path):
	get_node(path).queue_free()
	
	var scene = menu_screen.instantiate()
	get_node("/root/Node").add_child(scene)


func show_credits():
	show_scene(credits_screen)


func hide_credits():
	hide_scene("/root/Node/credits_screen")


func show_test():
	show_scene(test_screen)


func hide_test():
	hide_scene("/root/Node/test_screen")


func show_help():
	show_scene(help_screen)


func hide_help():
	hide_scene("/root/Node/help_screen")
