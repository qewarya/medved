extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -200.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction = 0
	
	if Input.is_action_pressed("ui_right"):
		if direction:
		velocity.x = direction * SPEED
		if direction==1:
			anim.flip_h=false
		else:
			anim.flip_h=true
		anim.play("run")
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		direction -= 1
		$AnimatedSprite.play("runleft")
	else:
		if is_on_floor():
			if Input.is_action_pressed("left click"):
				# Удар с помощью левой кнопки мыши
				$AnimatedSprite.play("attack1")
			else:
				$AnimatedSprite.play("idle")

	velocity.x = direction * SPEED

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite.play("jump")

	move_and_slide()
