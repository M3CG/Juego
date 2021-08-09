extends Camera

var distance = 40
var height = 2

func _ready():
	
	set_physics_process(true)
	set_as_toplevel(true)

func _physics_process(delta):
	var target = get_parent().get_global_transform().origin
	var pos = get_global_transform().origin
	var up = Vector3.UP
	
	var offset = pos - target
	
	offset = offset.normalized() * distance
	offset.y = height
	
	pos = target + offset
	
	look_at_from_position(pos,target,up)
