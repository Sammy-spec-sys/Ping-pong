extends Area2D

var speed = 400
var velocity = Vector2.ZERO

func _ready():
	reset_ball()

func _process(delta):
	position += velocity * delta
	
	# Detectar colisión con paredes superior e inferior
	if position.y <= 20 or position.y >= 700:
		velocity.y *= -1
	
	# Detectar si la pelota sale por los lados (punto anotado)
	if position.x < 0:
		get_parent().score_point(2)
		reset_ball()
	elif position.x > 1280:
		get_parent().score_point(1)
		reset_ball()

func reset_ball():
	position = Vector2(640, 360)
	# Dirección aleatoria al inicio
	var random_x = randf_range(-1, 1)
	var random_y = randf_range(-1, 1)
	velocity = Vector2(random_x, random_y).normalized() * speed

func _on_area_entered(area):
	# Rebote con las paletas
	if area.is_in_group("paddle"):
		velocity.x *= -1
		# Añadir variación según dónde golpea
		var collision_offset = (position.y - area.position.y) / 50.0
		velocity.y += collision_offset * 100
		velocity = velocity.normalized() * speed
