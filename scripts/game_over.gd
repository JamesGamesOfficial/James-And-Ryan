extends Control

func _on_respawn_pressed() -> void:
	get_tree().reload_current_scene()

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/non_playables/start_screen.tscn") 
