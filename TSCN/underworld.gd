extends Node2D

func _on_area_2d_body_entered(body):
	get_tree().change_scene_to_file("res://diemenu.tscn")


func _on_area_2d_2_body_entered(body):
	get_tree().change_scene_to_file("res://TSCN/underworld_2.tscn")

var animationPlayed = false
@onready var anim = $door/AnimatedSprite2D
func _on_area_2d_3_body_entered(body):
	if not animationPlayed:
		anim.play("default")
		animationPlayed = true
