extends ParallaxBackground


# Declare member variables here. Examples:
# var a = 2

var backspeed = 200
var accn =5
var obstacle1 = preload("res://Cactus01.tscn")
var obstacle2 = preload("res://Cactus02.tscn")
var obstacle3 = preload("res://Tree.tscn")
onready var counter = $Score/Counter

onready var obstacles = [obstacle1,obstacle2,obstacle3]

func _ready():
	randomize()
	$SpawnTimer.start()
	$Score/Score_Timer.start()
	SaveFile.score =0
	
	
func _physics_process(delta):
	scroll_base_offset.x += move_toward(0,backspeed,-1*accn)
	if int($Score/Counter.text)>int(SaveFile.highscore):
		SaveFile.highscore = $Score/Counter.text
		SaveFile.save_score(SaveFile.highscore)
	counter.text = str(SaveFile.score)

func _on_Cactus_body_entered(body):
	if body is Player:
		backspeed =0




func _on_SpawnTimer_timeout():
	var obs = obstacles[randi()%obstacles.size()].instance()
	obs.position = Vector2(394,rand_range(180,190))
	add_child_below_node($BackGround,obs)


func _on_Score_Timer_timeout():
	SaveFile.score +=1
