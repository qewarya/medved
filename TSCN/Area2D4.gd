extends Area2D

func _on_area_2d_4_body_entered(body):
	get_tree().change_scene_to_file("res://TSCN/menu.tscn")
