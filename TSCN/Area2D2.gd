extends Area2D

# Обработчик события входа в зону
func _on_area_2d_4_body_entered(body):
	get_tree().change_scene("res://TSCN/menu.tscn")
