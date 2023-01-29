extends KinematicBody2D
class_name Player
# A reference to the player's velocity
var velocity = Vector2()

# The player's speed
var speed = 4
# The player's jump strength
var jump_strength = -300

# The player's gravity
var gravity = 4
func _physics_process(delta):
	$AnimatedSprite.play("Run")
	#if speed<max_speed:
	#	velocity.x += speed

	# Jumping
	if is_on_floor():
		$Shadow.visible = true
		if Input.is_action_just_pressed("jump"):
			
			velocity.y = jump_strength
	else:
		$Shadow.visible = false
		$AnimatedSprite.play("Jump")
		apply_gravity()

	# Move the player
	velocity = move_and_slide(velocity,Vector2.UP)
func apply_gravity():
	velocity.y +=gravity
	if position.y>100:
		velocity.y+=gravity*2
