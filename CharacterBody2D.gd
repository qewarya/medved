extends CharacterBody2D

var speed = 0.0
var chase = false 

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
