extends KinematicBody2D


export var good=false 
export var hit=false


func _ready():
	pass 






func _on_VisibilityNotifier2D_screen_exited():
	if not hit:
		get_tree().change_scene("res://Lose.tscn")
