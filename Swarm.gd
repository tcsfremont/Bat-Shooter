extends Node2D

export var speed:=100.0
export var downtime:=1.0
export var direction:=1.0
export var downelapsed:=0.0
export var down:= false 

func _ready():
	pass 



func _process(delta):
	if down:
		position.y+=speed*delta
		downelapsed+=delta
		if downelapsed>=downtime:
			down=false
			downelapsed=0
	else:
		position.x+=speed*direction*delta
	if get_child_count()<=2:
		get_tree().change_scene("res://Win.tscn")


func _on_RightNotifier_screen_exited():
	direction=-1.0
	down=true


func _on_LeftNotifier_screen_exited():
	direction=1.0
	down=true
