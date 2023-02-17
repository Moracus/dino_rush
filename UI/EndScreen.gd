extends CanvasLayer



func _ready():
	$Score/Score_Timer.stop()
	$Score/Counter.text = str(SaveFile.score)
	$Label2.text = str(SaveFile.highscore)
func _on_Retry_pressed():
	Scenetranisit.change_scene("res://World.tscn")


func _on_Exit_pressed():
	get_tree().change_scene("res://Main.tscn")
