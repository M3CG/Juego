extends Camera

var velocidad_de_suavizado = 5
var lejania = 30
var altitud = 10
func _ready():
	set_as_toplevel(true)
	
func _physics_process(delta):
	
	self.translation = lerp(self.translation,get_parent().translation + Vector3(0,altitud,lejania), velocidad_de_suavizado * delta)
