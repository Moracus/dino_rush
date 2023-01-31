extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
var  score_cnt = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Score_Timer.start()


func _physics_process(delta):
	$Counter.text = str(score_cnt)


func _on_Score_Timer_timeout():
	score_cnt +=1
