extends KinematicBody2D
#class_name Player

var velocity = Vector2()
var jumping = false
var double_jumping = false
var died = false
# The player's speed
var speed = 4
# The player's jump strength
var jump_strength = -300
signal completed
signal death
# The player's gravity
var gravity = 6
func _ready():
	print("called")
	died = false
	$AnimatedSprite.animation= "Run"
func _physics_process(delta):
	apply_gravity(gravity)
	if died == true:
			death()
	else:
		if is_on_floor() :
			$AnimatedSprite.play("Run")
			$Shadow.visible = true
			jumping = false
			double_jumping = false
		
			if Input.is_action_just_pressed("jump"):
				velocity.y = jump_strength
		else:
			$Shadow.visible = false
			
			$AnimatedSprite.play("Jump")
		if not is_on_floor() and velocity.y>=0:
			if double_jumping == false:
				if Input.is_action_just_pressed("jump"):
					velocity.y = jump_strength
					apply_gravity(gravity+1)
					double_jumping = true
		velocity = move_and_slide(velocity,Vector2.UP)
func apply_gravity(gravity):
	velocity.y +=gravity
	if position.y>100:
		velocity.y+=gravity*2
func death():

	$AnimatedSprite.play("Death")
	yield($AnimatedSprite,"animation_finished")
func sfx():
	$AudioStreamPlayer2D.playing = true
	yield($AudioStreamPlayer2D,"finished")
func game_over():
	SaveFile.max_speed=0
	yield(death(),"completed")

	Scenetranisit.change_scene("res://UI/EndScreen.tscn")
