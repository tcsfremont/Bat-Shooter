extends Area2D

export var speed :=1500.0




func _ready():
	pass 



func _process(delta):
	position.y-= speed*delta
	var bodies:=get_overlapping_bodies()
	for body in bodies:
		if not body.good:
			body.hit=true
			body.queue_free()
			queue_free()
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
