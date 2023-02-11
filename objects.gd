extends Area2D
onready var speed = SaveFile.speed

func _physics_process(delta):
	position.x += -1*speed
func _on_Cactus_body_entered(body):
	if body is Player:
		get_tree().change_scene("res://UI/EndScreen.tscn")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
