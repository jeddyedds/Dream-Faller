extends Control





func _on_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_how_to_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://How to Screen.tscn")


func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://Credits Screen.tscn")
