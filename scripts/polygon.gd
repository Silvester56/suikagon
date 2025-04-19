extends RigidBody2D

var allEdges = [3, 4, 5, 6, 8, 10, 12, 15, 20, 24, 30]
var allColors = [Color.SLATE_BLUE, Color.SALMON, Color.TOMATO, Color.REBECCA_PURPLE, Color.SPRING_GREEN, Color.LIGHT_STEEL_BLUE, Color.FOREST_GREEN, Color.AQUAMARINE, Color.PURPLE, Color.DARK_GOLDENROD, Color.CHARTREUSE]
var points = [1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66]
var currentIndex: int
var detectable = true

func setAttributes(index: int) -> void:
	currentIndex = index
	var edges = allEdges[index]
	var radius = edges * (5 - index * 0.15)
	var polygonVectorArray = []
	var angle = 2 * PI / edges
	for i in edges:
		polygonVectorArray.push_back(Vector2(cos(angle * i) * radius, sin(angle * i) * radius))
	$CollisionShape2D.set_deferred("polygon", polygonVectorArray)
	$Polygon2D.polygon = polygonVectorArray
	$Polygon2D.color = allColors[index]
	$GPUParticles2D.process_material.color = Color(1 - allColors[index].r, 1 - allColors[index].g, 1 - allColors[index].b, allColors[index].a)

func playMergeEffects() -> void:
	$GPUParticles2D.emitting = true
	$Merge.play()

func testTouchingPolygon(body: Node) -> void:
	if body.currentIndex == currentIndex and currentIndex < len(allEdges) - 1:
		$"..".addToScore(points[currentIndex])
		body.playMergeEffects()
		body.setAttributes(currentIndex + 1)
		detectable = false
		body.checkTouchingPolygons()
		queue_free()

func checkTouchingPolygons() -> void:
	for body in get_colliding_bodies():
		if body.has_method("setAttributes") and body.detectable:
			testTouchingPolygon(body)

func _on_body_entered(_body) -> void:
	checkTouchingPolygons()
