extends Control



func _on_play_pressed() -> void:
	#changes to the Hunt Menu
	get_tree().change_scene_to_file("res://scences/menus/hunt_menu.tscn")


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	#closes game
	get_tree().quit()
