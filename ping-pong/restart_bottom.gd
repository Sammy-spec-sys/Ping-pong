extends Button

func _ready():
	print("RestartButton iniciado")

func _pressed():
	print("¡¡¡CLICK EN REINICIAR DETECTADO!!!")
	# Despausar y reiniciar
	var main = get_tree().root.get_node("Main")
	main.is_paused = false
	get_tree().paused = false
	get_tree().reload_current_scene()
