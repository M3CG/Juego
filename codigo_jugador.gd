#Este codigo es funcional pero sin optimizar todavia

extends RigidBody

#declaracion de variables
var direccion_y: float
var direccion_x: float
var puede_saltar := true

#funcion principal
func _process(delta):
	
 #en cada fotograma aclaro que direccion va a ser relativa al personaje, para poder conocer siempre su orientacion hacia arriba y hacia adelante (local y no global)
	direccion_y = transform.orthonormalized().basis.y.y
	direccion_x = transform.orthonormalized().basis.y.x
	
# codigo comentado porque a pesar de ser funcional, se interpone con la gravedad
#	apply_impulse(Vector3(-direccion_x,-direccion_y,0) * 5,Vector3(0,-1,0))
#	apply_impulse(Vector3(direccion_x,direccion_y,0) * 5,Vector3(0,0.1,0))
	
# codigo que equilibra al personaje sin interferir con la gravedad
	add_force(Vector3(0,2,0),Vector3(direccion_x,direccion_y,0) * 10)
	add_force(Vector3(0,-2,0),Vector3(-direccion_x,-direccion_y,0) * 10)

# quiero que el personaje salte siempre hacia donde "apunta"
	if Input.is_action_just_pressed("ui_up") and puede_saltar:
		apply_impulse(Vector3(-direccion_x,-direccion_y,0).normalized(),Vector3(direccion_x,direccion_y,0)*35)

#mismo principio para elquilibrar el personaje, es usado para inclinarlo, el aplicar 2 fuerzas en ves de 1 hace que en la inclinacion, no lo termine arrastrando
	if Input.is_action_pressed("ui_right"):
		add_force(Vector3(direccion_y,-direccion_x,0).normalized()*10,Vector3(direccion_x,direccion_y,0))
		add_force(Vector3(-direccion_y,direccion_x,0).normalized()*10,Vector3(-direccion_x,-direccion_y,0))
	elif Input.is_action_pressed("ui_left"):
		add_force(Vector3(-direccion_y,direccion_x,0).normalized()*10,Vector3(direccion_x,direccion_y,0))
		add_force(Vector3(direccion_y,-direccion_x,0).normalized()*10,Vector3(-direccion_x,-direccion_y,0))


#señales para el salto del personaje
func _on_Pies_body_entered(body):
	if body != $RigidBody:
		puede_saltar = true
func _on_Pies_body_exited(body):
	puede_saltar = false

