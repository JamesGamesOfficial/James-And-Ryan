extends Control


func _on_resume_pressed() -> void:
	get_tree().paused = false
	self.hide()

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/non_playables/start_screen.tscn")


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
