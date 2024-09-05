extends CharacterBody2D


const SPEED = 200.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var Animated_Sprite_2D = $AnimatedSprite2D

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	var directionUD = Input.get_axis("move_up", "move_down")
	

	if direction > 0:
		Animated_Sprite_2D.flip_h = false
		$AnimatedSprite2D.play("MovingLR")
	elif direction < 0:
			Animated_Sprite_2D.flip_h = true
			$AnimatedSprite2D.play("MovingLR")
	elif direction || directionUD >= 0:
		if Input.is_action_pressed ("move_down") :
			$AnimatedSprite2D.play("Down")
		else: 
			$AnimatedSprite2D.play("Idle")
		
		
	if directionUD > 0:
		$AnimatedSprite2D.play("Down")
	elif directionUD < 0:
		$AnimatedSprite2D.play("Up")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if directionUD:
		velocity.y = directionUD * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
