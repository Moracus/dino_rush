extends Area2D


onready var speed = SaveFile.speed

func _physics_process(delta):
	position.x += move_toward(0,SaveFile.max_speed*-1,SaveFile.accn)


func _on_Cactus02_body_entered(body):
	body.died = true
	body.death()
	body.game_over()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()       
