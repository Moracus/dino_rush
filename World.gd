extends ParallaxBackground


# Declare member variables here. Examples:
# var a = 2

var backspeed = 500

var obstacle1 = preload("res://Cactus01.tscn")
var obstacle2 = preload("res://Cactus02.tscn")
var obstacle3 = preload("res://Tree.tscn")
var obstacle4 = preload("res://Cactus03.tscn")
onready var counter = $Score/Counter
onready var accn:int= SaveFile.accn
onready var obstacles = [obstacle1,obstacle2,obstacle3]

func _ready():
	randomize()
	$SpawnTimer.start()
	$Score/Score_Timer.start()
	SaveFile.score = 0
	SaveFile.accn = 2
	SaveFile.max_speed = 10
func _physics_process(delta):
	var accn = SaveFile.accn
	scroll_base_offset.x += move_toward(0,-1*SaveFile.max_speed,accn)
	if int($Score/Counter.text)>int(SaveFile.highscore):
		SaveFile.highscore = $Score/Counter.text
		SaveFile.save_score(SaveFile.highscore)
	counter.text = str(SaveFile.score)



func _on_SpawnTimer_timeout():
	var obs = obstacles[randi()%obstacles.size()].instance()
	obs.position = Vector2(394,rand_range(180,190))
	add_child_below_node($BackGround,obs)
	if SaveFile.score >20 and obstacles.size() ==3:
		obstacles.append(obstacle4)
