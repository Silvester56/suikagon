extends RigidBody2D

var allEdges = [3, 4, 5, 6, 8, 10, 12, 15, 20, 24, 30]
var allColors = [Color.SLATE_BLUE, Color.SALMON, Color.TOMATO, Color.REBECCA_PURPLE, Color.SPRING_GREEN, Color.LIGHT_STEEL_BLUE, Color.FOREST_GREEN, Color.AQUAMARINE, Color.PURPLE, Color.DARK_GOLDENROD, Color.CHARTREUSE]

func setAttributes(index: int) -> void:
	var edges = allEdges[index]
	var radius = edges * (5 - index * 0.15)
	var polygonVectorArray = []
	var angle = 2 * PI / edges
	for i in edges:
		polygonVectorArray.push_back(Vector2(cos(angle * i) * radius, sin(angle * i) * radius))
	$CollisionShape2D.polygon = polygonVectorArray
	$Polygon2D.polygon = polygonVectorArray
	$Polygon2D.color = allColors[index]
