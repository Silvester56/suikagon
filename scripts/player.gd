extends CharacterBody2D

@export var Polygon: PackedScene

var speed = 100
var currentShape
var canGetNextShape = true
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	getNextShape()

func _physics_process(delta: float) -> void:
	var directionX := Input.get_axis("left", "right")
	if Input.is_action_just_pressed("drop") and !canGetNextShape:
		drop()
	if directionX:
		velocity.x = directionX * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	move_and_slide()

func drop() -> void:
	$Drop.play()
	currentShape.freeze = false
	currentShape.connect("body_entered", _on_shape_collision)
	currentShape.reparent($"..")
	canGetNextShape = true

func _on_shape_collision(body) -> void:
	currentShape.disconnect("body_entered", _on_shape_collision)
	getNextShape()

func addShapeAsAChild(polygon) -> void:
	add_child(polygon)
	canGetNextShape = false

func getNextShape() -> void:
	if canGetNextShape:
		currentShape = Polygon.instantiate()
		currentShape.z_index = 1
		currentShape.z_as_relative = false
		currentShape.setAttributes(rng.randi_range(0, 4))
		currentShape.freeze = true
		call_deferred("addShapeAsAChild", currentShape)
