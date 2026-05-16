extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

const SPEED = 500.0
const JUMP_FORCE = -1100.0
const GRAVITY = 1800

var jumped_in_air = false


func _physics_process(delta):

	# movimento horizontal
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = lerp(velocity.x, direction * SPEED, 0.2)

	# virar sprite
	if direction != 0:
		anim.flip_h = direction < 0

	# pulo e pulo duplo
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_FORCE
			jumped_in_air = false

		elif not jumped_in_air:
			velocity.y = JUMP_FORCE
			jumped_in_air = true

	# gravidade
	velocity.y += GRAVITY * delta

	# movimento físico
	move_and_slide()

	# animações
	if not is_on_floor():

		if velocity.y < 0:
			anim.play("jump")
		else:
			anim.play("fall")

	elif direction != 0:
		anim.play("run")

	else:
		anim.play("idle")
