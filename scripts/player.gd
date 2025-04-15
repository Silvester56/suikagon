extends CharacterBody2D

var speed = 100

func _physics_process(delta: float) -> void:
	var directionX := Input.get_axis("left", "right")
	if directionX:
		velocity.x = directionX * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	move_and_slide()
