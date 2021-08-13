extends RigidBody


func _process(delta):
	var direccion_y = -abs(transform.basis.get_rotation_quat().w)
	var direccion_x = - transform.basis.get_rotation_quat().z
	var giro = get_rotation().z
	var circular_rotation = giro * 57.29578
	add_force(Vector3(0,4,0),Vector3(direccion_x,direccion_y,0))
	
	if Input.is_action_pressed("ui_up"):
		apply_central_impulse(Vector3(-abs(cos(circular_rotation)),abs(sin(circular_rotation)),0))
	elif circular_rotation < 0:
			apply_central_impulse(Vector3(abs(cos(circular_rotation)),abs(sin(circular_rotation)),0))

	if Input.is_action_pressed("ui_right") and giro > -1:
		apply_torque_impulse(Vector3(0,0,-0.05))
	elif Input.is_action_pressed("ui_left") and giro < 1:
		apply_torque_impulse(Vector3(0,0,0.05))
