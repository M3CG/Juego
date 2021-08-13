extends RigidBody


func _physics_process(delta):
	add_torque(Vector3(0,0,20))
