extends KinematicBody2D

export var good=true 
var speed:=800.0
onready var Laser=load("res://Laser.tscn")

func _ready():
	pass 

func _process(delta):
	var viewport_rect=get_viewport_rect()
	var width=$Sprite.get_rect().size.x*scale.x
	var parent =get_parent()
	
	
	
	if Input.is_action_pressed("move_left"):
		position.x-=speed*delta
	if Input.is_action_pressed("move_right"):
		position.x+=speed*delta
	position.x=clamp(position.x,width*0.5,viewport_rect.size.x-width*0.5)
	if Input.is_action_just_pressed("fire"):
		var laser=Laser.instance()
		laser.position=position
		parent.add_child(laser)
