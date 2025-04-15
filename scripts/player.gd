extends CharacterBody2D

@export var Triangle: PackedScene

var speed = 100
var currentShape
var canGetNextShape = true

func _ready() -> void:
	getNextShape()

func _physics_process(delta: float) -> void:
	var directionX := Input.get_axis("left", "right")
	if Input.is_action_just_pressed("drop"):
		drop()
	if directionX:
		velocity.x = directionX * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	move_and_slide()

func drop() -> void:
	canGetNextShape = true
	currentShape.reparent($"..")
	currentShape.gravity_scale = 0.5
	currentShape.connect("body_entered", _on_shape_collision)

func _on_shape_collision(body) -> void:
	getNextShape()

func getNextShape() -> void:
	if canGetNextShape:
		currentShape = Triangle.instantiate()
		currentShape.gravity_scale = 0
		call_deferred("add_child", currentShape)
		canGetNextShape = false
