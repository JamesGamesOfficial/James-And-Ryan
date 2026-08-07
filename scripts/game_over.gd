extends Control

@onready var player = $"../.."

func _on_respawn_pressed() -> void:
	player.global_position = player.spawn_point.global_position
	self.hide()
	get_tree().paused = false

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/non_playables/start_screen.tscn") 
