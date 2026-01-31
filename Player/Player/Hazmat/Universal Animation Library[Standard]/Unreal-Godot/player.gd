extends Node3D

@export var speed: float = 5.0
@export var rotation_speed: float = 2.0

func _process(delta):
	var direction = Vector3.ZERO

	# Déplacements latéraux
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	# Avancer / Reculer
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1
	if Input.is_action_pressed("ui_down"):
		direction.z += 1

	# Normaliser pour éviter d'aller plus vite en diagonale
	if direction != Vector3.ZERO:
		direction = direction.normalized()

	# Convertir direction locale → direction globale selon la rotation du Node3D
	var global_move = transform.basis * direction

	# Appliquer le mouvement
	translate(global_move * speed * delta)
