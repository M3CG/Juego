extends RigidBody

var jump_force = 30
var rotation_speed = 0.1
var acceleration = 5
var circular_rotation = 0

func _process(delta):
	var torque_force = 0

	if Input.is_action_pressed("ui_up"):
		if circular_rotation > 0:
			apply_central_impulse(Vector3(-abs(cos(circular_rotation)),abs(sin(circular_rotation)),0))
		elif circular_rotation < 0:
			apply_central_impulse(Vector3(abs(cos(circular_rotation)),abs(sin(circular_rotation)),0))

	if Input.is_action_pressed("ui_right"):
#		apply_torque_impulse(Vector3(0,0,-0.1))	
		torque_force -= rotation_speed
	elif Input.is_action_pressed("ui_left"):
#		apply_torque_impulse(Vector3(0,0,0.1))	
		torque_force += rotation_speed
	
	circular_rotation = get_rotation().z * 57.29578
	print(abs(cos(circular_rotation)))
	if circular_rotation < (-45)  :
		torque_force = 0.1
	elif circular_rotation > 45 :
		torque_force = -0.1

	apply_torque_impulse(Vector3(0,0,torque_force))
	print(get_rotation())
