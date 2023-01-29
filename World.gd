extends ParallaxBackground


# Declare member variables here. Examples:
# var a = 2

var backspeed = 20
var accn =2
var obstacle1 = preload("res://Cactus01.tscn")
var obstacle2 = preload("res://Cactus02.tscn")
var obstacle3 = preload("res://Tree.tscn")
onready var obstacles = [obstacle1,obstacle2,obstacle3]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$SpawnTimer.start()
	
	


func _physics_process(delta):
	scroll_base_offset.x += move_toward(0,backspeed,-1*accn)
	




func _on_Cactus_body_entered(body):
	if body is Player:
		backspeed =0




func _on_SpawnTimer_timeout():
	var obs = obstacles[randi()%obstacles.size()].instance()
	obs.position = Vector2(394,rand_range(180,190))
	add_child_below_node($BackGround,obs)
