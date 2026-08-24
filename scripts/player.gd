extends CharacterBody2D

@onready var camera = $Camera2D

@onready var spawn_point = $"../SpawnPoint1"
@onready var sprite = $AnimatedSprite2D

@export var speed: float = 300.0
@export var jump_velocity: float = -800.0

var checkpoint_test_unlocked = false

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
		$AnimatedSprite2D.play("Jump")
		if $AnimatedSprite2D.animation == "Walk":
			$AnimatedSprite2D.play("Jump")
	else:
		if $AnimatedSprite2D.animation == "Jump":
			$AnimatedSprite2D.stop()
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
		$AnimatedSprite2D.play("Jump")
	if Input.is_action_just_released("ui_accept") and velocity.y < 0:
		velocity.y *= 0.5
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
		$AnimatedSprite2D.play("Walk")
		if direction > 0:
			sprite.flip_h = false
		elif direction < 0:
			sprite.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		if $AnimatedSprite2D.animation == "Walk":
			$AnimatedSprite2D.stop()
	move_and_slide()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true
		$Camera2D/PauseMenu.show()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("kill floor"):
		$Camera2D/GameOver.show()
		get_tree().paused = true
	if body.is_in_group("Checkpoint 1"):
		spawn_point = $"../SpawnPoint2"
		if checkpoint_test_unlocked == false:
			$Camera2D/AnimationPlayer.play("Unlock_CheckPoint")
		checkpoint_test_unlocked = true
		
