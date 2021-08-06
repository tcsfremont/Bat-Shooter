extends KinematicBody2D

onready var Laser=load("res://Phaser.tscn")
var rng=RandomNumberGenerator.new()
export var good := -1
export var hit=false
export var min_cooldown=1.0
export var max_cooldown=10.0
var cooldown_remaining=0.0

func reset_cooldown():
	cooldown_remaining=rng.randf_range(min_cooldown,max_cooldown)


func _ready():
	rng.randomize()
	reset_cooldown()


func _process(delta):
	var parent=get_parent()
	if cooldown_remaining <= 0.0:
		var laser=Laser.instance()
		laser.position=position
		parent.add_child(laser)
		reset_cooldown()
	else:
		cooldown_remaining-=delta



func _on_VisibilityNotifier2D_screen_exited():
	if not hit:
		get_tree().change_scene("res://Lose.tscn")
