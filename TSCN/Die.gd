extends Area2D


func _on_die_body_entered():
	get_tree().change_scene_to_file("res://diemenu.tscn")
