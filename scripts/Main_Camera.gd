extends Camera2D

@export var player: CharacterBody2D
@export var max_look_distance: float = 150.0 
@export var follow_speed: float = 5.0        

func _ready() -> void:
	if not player:
		player = get_node_or_null("../Player")

func _process(delta: float) -> void:
	if not player:
		return
	var mouse_pos = get_global_mouse_position()
	var player_pos = player.global_position
	var look_offset = mouse_pos - player_pos
	if look_offset.length() > max_look_distance:
		look_offset = look_offset.normalized() * max_look_distance
	var target_position = player_pos + look_offset
	global_position = global_position.lerp(target_position, follow_speed * delta)
