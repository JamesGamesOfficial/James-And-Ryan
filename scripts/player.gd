extends CharacterBody2D

@onready var camera = $Camera2D

@export var speed: float = 300.0
@export var jump_velocity: float = -800.0

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
	if Input.is_action_just_released("ui_accept") and velocity.y < 0:
		velocity.y *= 0.5
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	move_and_slide()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true
		$Camera2D/PauseMenu.show()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("kill floor"):
		$Camera2D/GameOver.show()
		get_tree().paused = true
