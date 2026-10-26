extends Button

func _ready():
	print("ResumeButton iniciado")

func _pressed():
	print("¡¡¡CLICK EN REANUDAR DETECTADO!!!")
	# Llamar a la función de Main en lugar de hacerlo manualmente
	get_tree().root.get_node("Main").toggle_pause()
