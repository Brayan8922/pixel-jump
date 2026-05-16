extends CharacterBody2D


@onready var anim = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	anim.play("default")
	move_and_slide()
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("next_lvl")
	
