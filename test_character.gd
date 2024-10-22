extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -4

@export var speed = 400
var screen_size
var currYPosition
var currVelocity
var jumpFrame = 20
var justLanded = true


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y += JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide();
	





# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.animation = "falling"
	$AnimatedSprite2D.play()
	currYPosition = 0
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		if Input.is_action_pressed("move_left"):
			velocity.x -= 2
	
	
	if Input.is_action_just_released("move_right"):
		velocity.x -= 1
	
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		if Input.is_action_pressed("move_right"):
			velocity.x += 2
		
		
	if Input.is_action_just_released("move_left"):
		velocity.x += 1
		
	if (Input.is_action_just_pressed("jump") && jumpFrame == 20 && position.y < currYPosition):
		jumpFrame = 0;
		velocity.y += JUMP_VELOCITY
		jumpFrame = jumpFrame + 1
		$JumpingSound.play()
			
	if (jumpFrame < 20):
		velocity.y = JUMP_VELOCITY + (0.001 * jumpFrame)
		jumpFrame = jumpFrame + 1
		if (jumpFrame == 20):
			velocity.y = 0
			
			
	
		
		
	#if up is pressed
		#if player is on cloud
		#set animation to falling
			
		

	if velocity.length() > 0:
		velocity = velocity * speed
		
	# if just landed on cloud
	if (position.y < currYPosition && justLanded):
		$LandingSound.play()
		justLanded = false
	
	if (position.y > currYPosition):
		justLanded = true
		
		
	
	
	# if on cloud and not moving
	if (position.y < currYPosition && velocity.x == 0):
		if ($AnimatedSprite2D.animation != "idle"):
			$AnimatedSprite2D.animation = "idle"
			
	#if on cloud and moving
	if (position.y < currYPosition && velocity.x < 0):
		if ($AnimatedSprite2D.animation != "walk_left"):
			$AnimatedSprite2D.animation = "walk_left"
	if (position.y < currYPosition && velocity.x > 0):
		if ($AnimatedSprite2D.animation != "walk_right"):
			$AnimatedSprite2D.animation = "walk_right"
	
	# if falling
	if (position.y > currYPosition):
		if ($AnimatedSprite2D.animation != "falling"):
			$AnimatedSprite2D.animation = "falling"
	
	
	position += velocity * delta
	position.x = clamp(position.x, -25, screen_size.x-50)
	
	currYPosition = position.y
	currVelocity = velocity.y
	
	move_and_slide()
	
	


	
