extends CharacterBody2D

var speed = 200.0
var chase = false 

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	var player = $"../../Player/Player"
	var direction = (player.position - self.position).normalized()
	if chase == true:
		velocity.x = speed  * direction.x
	
	move_and_slide()

func _on_detector_body_entered(body):
	if body.name == "Player":
		chase = true
	
