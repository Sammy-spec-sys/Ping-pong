extends Area2D

var speed = 300

func _ready():
	add_to_group("paddle")

func _process(delta):
	# Controles: Flechas arriba y abajo
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
	
	# Limitar movimiento a la pantalla
	position.y = clamp(position.y, 50, 670)
