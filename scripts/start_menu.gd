extends Control


func _ready() -> void:
	get_tree().paused = true


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/playables/main.tscn")


func _on_settings_pressed() -> void:
	pass # Replace with function body.


func _on_credits_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
