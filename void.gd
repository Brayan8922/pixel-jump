extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("Houve colisão com: ", body.name)
	if body.is_in_group("player"):
		get_tree().reload_current_scene()
