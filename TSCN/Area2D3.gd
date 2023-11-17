extends Area2D

func _on_area_2d_2_body_entered(body):
		print("sss")
		get_tree().change_scene_to_file("res://diemenu.tscn")
