extends CharacterBody2D

const SPEED = 200

func _physics_process(delta):
	var motion = Vector2.ZERO
	var player = get_parent().get_node("Player")
	var player_position = player.global_position
	var enemy_position = global_position
	var direction = player_position - enemy_position
	direction = direction.normalized()



	if Input.is_action_pressed("ui_right"):
		motion.x += SPEED

	if Input.is_action_pressed("ui_left"):
		motion.x -= SPEED

	if Input.is_action_pressed("ui_down"):
		motion.y += SPEED

	if Input.is_action_pressed("ui_up"):
		motion.y -= SPEED

	motion = move_and_slide()
