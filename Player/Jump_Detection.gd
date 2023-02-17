extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):

	SaveFile.score +=1
#	if SaveFile.score%5 ==0 and SaveFile.score !=0:
#		if SaveFile.accn < SaveFile.max_accn:
#			SaveFile.accn += 1
