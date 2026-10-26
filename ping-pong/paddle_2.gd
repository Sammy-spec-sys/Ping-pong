extends Area2D

var speed = 250
var ball = null

func _ready():
	add_to_group("paddle")
	# Buscar Ball al inicio
	ball = get_parent().get_node_or_null("Ball")
	
	if ball == null:
		print("ERROR: Paddle2 no puede encontrar Ball")
	else:
		print("Paddle2 encontró Ball correctamente")

func _process(delta):
	# Si no tenemos referencia a Ball, intentar buscarla de nuevo
	if ball == null:
		ball = get_parent().get_node_or_null("Ball")
		return
	
	# Seguir la pelota
	if ball.position.y > position.y + 10:
		position.y += speed * delta
	elif ball.position.y < position.y - 10:
		position.y -= speed * delta
	
	# Limitar movimiento a la pantalla
	position.y = clamp(position.y, 50, 670)
