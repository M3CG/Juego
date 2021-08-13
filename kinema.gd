extends KinematicBody


export var speed = 10
export var acceleration = 5
export var gravity = 0.98
export var jump_power = 3

onready var head = $CSGMesh

var velocity = Vector3()

func _physics_process(delta):
	var head_basis = head.get_global_transform().basis

	var direction = Vector3()
	
	if Input.is_action_pressed("ui_up"):
		direction -= head_basis.z
		#velocity.y += jump_power
	elif Input.is_action_pressed("ui_down"):
		direction += head_basis.z
	
	if Input.is_action_pressed("ui_left"):
		direction -= head_basis.x 
	elif Input.is_action_pressed("ui_right"):
		direction += head_basis.x
	

	direction = direction.normalized()
	
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	velocity.y -= gravity
	velocity = move_and_slide(velocity)
