extends Node2D

#func _ready():
	
func _on_Start_pressed():
	get_tree().change_scene("res://World.tscn")


func _on_Exit_pressed():
	get_tree().quit()


#func _on_Musictn_pressed():
#	$TitleScreen/Musictn.disabled = true
#	Music.get_node("AudioStreamPlayer2D").playing = false


func _on_Musictn_toggled(button_pressed):
#	$TitleScreen/Musictn.icon ="res://mute (1).png"
	Music.get_node("AudioStreamPlayer2D").playing = !Music.get_node("AudioStreamPlayer2D").playing
