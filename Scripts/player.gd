extends CharacterBody2D


var SPEED = 200.0

@onready var Animated_Sprite_2D = $AnimatedSprite2D

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	var directionUD = Input.get_axis("move_up", "move_down")
	

	if velocity.x > 0:
		Animated_Sprite_2D.flip_h = false
		$AnimatedSprite2D.play("MovingLR")
	elif velocity.x < 0:
			Animated_Sprite_2D.flip_h = true
			$AnimatedSprite2D.play("MovingLR")
	elif velocity.x || velocity.y >= 0:
		if Input.is_action_pressed ("move_down") :
			$AnimatedSprite2D.play("Down")
		else: 
			$AnimatedSprite2D.play("Idle")
		
		
	if velocity.y > 0:
		$AnimatedSprite2D.play("Down")
	elif velocity.y < 0:
		$AnimatedSprite2D.play("Up")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if directionUD:
		velocity.y = directionUD * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if Input.is_action_pressed("run"):

		SPEED = 300
	else:
		SPEED = 200

	move_and_slide()
