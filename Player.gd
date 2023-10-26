extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

const GRAVITY = 200.0
const WALK_SPEED = 30
const JUMP_SPEED = -100.0

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_SPEED
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = true
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = false
		velocity.x =  WALK_SPEED
	else:
		$AnimatedSprite2D.play("idle")
		velocity.x = 0

	# "move_and_slide" already takes delta time into account.
	move_and_slide()
