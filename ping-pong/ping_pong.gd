extends Node2D

var score1 = 0
var score2 = 0
var score_label = null
var is_paused = false

func _ready():
	print("Juego iniciado")
	
	score_label = get_node_or_null("UI/ScoreLabel")
	
	if score_label == null:
		for child in get_children():
			if child.name == "UI":
				for subchild in child.get_children():
					if subchild.name == "ScoreLabel":
						score_label = subchild
						break
	
	if score_label:
		print("✓ ScoreLabel encontrado")
		update_score_label()
	
	# AÑADE ESTAS LÍNEAS:
	var resume_btn = get_node_or_null("UI/PauseMenu/Panel/ResumeButton")
	if resume_btn:
		resume_btn.pressed.connect(_on_resume_button_pressed)
		print("✓ ResumeButton conectado manualmente")
	
	var restart_btn = get_node_or_null("UI/PauseMenu/Panel/RestartButton")
	if restart_btn:
		restart_btn.pressed.connect(_on_restart_button_pressed)
		print("✓ RestartButton conectado manualmente")

	
	if score_label:
		print("✓ ScoreLabel encontrado")
		update_score_label()

func _input(event):
	# Usar _input en lugar de _process para detectar teclas
	if event.is_action_pressed("ui_cancel"):
		print("ESC presionado")
		toggle_pause()

func score_point(player):
	if player == 1:
		score1 += 1
	else:
		score2 += 1
	
	update_score_label()
	check_winner()

func update_score_label():
	if score_label != null:
		score_label.text = str(score1) + " : " + str(score2)

func check_winner():
	if score1 >= 5:
		game_over("¡GANASTE!")
	elif score2 >= 5:
		game_over("¡PERDISTE!")

func game_over(message):
	print(message)
	
	if score_label:
		score_label.text = message
	
	var game_over_label = get_node_or_null("UI/GameOverLabel")
	if game_over_label:
		game_over_label.text = message
		game_over_label.visible = true
	
	await get_tree().create_timer(0.5).timeout
	get_tree().paused = true

func toggle_pause():
	is_paused = !is_paused
	print("Pausando: " + str(is_paused))
	
	var pause_menu = get_node_or_null("UI/PauseMenu")
	if pause_menu:
		pause_menu.visible = is_paused
		get_tree().paused = is_paused
		print("✓ Menú de pausa actualizado")
	else:
		print("ERROR: No se encuentra PauseMenu")

func _on_resume_button_pressed():
	print("🔵 REANUDAR presionado")
	toggle_pause()

func _on_restart_button_pressed():
	print("🔴 REINICIAR presionado")
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_resume_bottom_pressed() -> void:
	pass # Replace with function body.


func _on_restart_bottom_pressed() -> void:
	pass # Replace with function body.
