# Script temporal solo para crear el polígono
extends Polygon2D

func _ready():
	var points = []
	var radius = 10
	var num_points = 32
	
	for i in range(num_points):
		var angle = (i * 2 * PI) / num_points
		var x = cos(angle) * radius
		var y = sin(angle) * radius
		points.append(Vector2(x, y))
	
	polygon = PackedVector2Array(points)
	color = Color.WHITE
