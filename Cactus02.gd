extends Area2D


onready var speed = get_parent().backspeed
onready var accn = get_parent().accn

func _physics_process(delta):
	position.x += move_toward(0,speed,-1*accn)


func _on_Cactus02_body_entered(body):
		if body is Player:
			get_tree().change_scene("res://UI/EndScreen.tscn")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()       
