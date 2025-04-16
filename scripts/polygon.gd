extends RigidBody2D

func setAttributes(edges: int, scale: float) -> void:
	var polygonVectorArray = []
	var angle = 2 * PI / edges
	for i in edges:
		polygonVectorArray.push_back(Vector2(cos(angle * i) * scale, sin(angle * i) * scale))
	$CollisionShape2D.polygon = polygonVectorArray
	$Polygon2D.polygon = polygonVectorArray
