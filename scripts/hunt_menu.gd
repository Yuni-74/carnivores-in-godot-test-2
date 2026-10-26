extends Control


func _on_hunt_pressed() -> void:
	
	# starts the hunt if map is chose
	if GlobalVar.test_map_1 :      # Del Hills
		get_tree().change_scene_to_file("res://scences/games/game_del_hills.tscn")
	elif GlobalVar.test_map_2 :  # may jung
		get_tree().change_scene_to_file("res://scences/games/game_may_jung.tscn")
	else :
		print("please pick a map")
	


func _on_map_1_pressed() -> void:
	
	# picks the map (Del Hills)
	GlobalVar.test_map_1 = true
	
	#unselects all other maps
	GlobalVar.test_map_2 = false
	
func _on_map_2_pressed() -> void:
	
	# picks the map (May Jung)
	GlobalVar.test_map_2 = true
	
	#unselects all other maps
	GlobalVar.test_map_1 = false



func _on_dino_1_pressed() -> void:
	pass # Replace with function body.


func _on_gun_1_pressed() -> void:
	pass # Replace with function body.


func _on_back_pressed() -> void:
	# takes you back to main menu
	get_tree().change_scene_to_file("res://scences/menus/main_menu.tscn")
