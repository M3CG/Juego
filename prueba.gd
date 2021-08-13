extends RigidBody

func _process(delta):
	var circular_rotation = get_rotation().z
	var torque_force = 0
	
	if Input.is_action_pressed("ui_right"):
		torque_force -= 0.1
	elif Input.is_action_pressed("ui_left"):
		torque_force += 0.1
	
	var damp_angular = abs(get_rotation().z/(PI * 2)) + 0.407
	
	print(circular_rotation)
	if circular_rotation > 0 and circular_rotation < 3:
		torque_force += 0.1
	elif circular_rotation < 0 and circular_rotation > (-3):
		torque_force -= 0.1
	elif circular_rotation < (-3) or circular_rotation > 3:
		damp_angular = 0.89
	
	set_angular_damp(damp_angular)
	
	apply_torque_impulse(Vector3(0,0,torque_force))
