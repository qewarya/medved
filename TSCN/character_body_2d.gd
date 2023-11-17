extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -250.0
var Attack = false;

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = $AnimatedSprite
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite.play("jump")
	var direction = Input.get_axis("ui_left", "ui_right")
	Attack = false
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)	
		if velocity.y == 0:
			anim.play("idle")
		
	if direction == -1:
		$AnimatedSprite.flip_h = true
	elif direction == 1:
		$AnimatedSprite.flip_h = false
	if velocity.y > 0:
		anim.play("fall")		
	if Input.is_action_just_pressed("attack"):
		$AnimatedSprite.play("attack")
		Attack = true
	else:
		Attack = false

	velocity.x = direction * SPEED
	
	move_and_slide()




func _on_animated_sprite_animation_finished():
	if $AnimatedSprite.animation == "Attack":
		Attack = false
