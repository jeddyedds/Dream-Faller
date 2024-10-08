extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var speed = 400
var screen_size
var currYPosition


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	





# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.animation = "falling"
	$AnimatedSprite2D.play()
	currYPosition = 0
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	
	# if on cloud
		# set velocity.y to velocity of cloud
	# else
		# velocity.y = 0.5
	
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		if Input.is_action_pressed("move_left"):
			velocity.x -= 2
	
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		if Input.is_action_pressed("move_right"):
			velocity.x += 2
		
		
	if Input.is_action_just_released("move_right"):
		velocity.x -= 1
		# if on cloud
			# $AnimatedSprite2D.animation = "idle"
		# else
			# $AnimatedSprite2D.animation = "falling"
	
	
	#if Input.is_action_pressed("move_left"):
		#velocity.x -= 1
		#if Input.is_action_pressed("move_right"):
			#velocity.x += 1
		
	if Input.is_action_just_released("move_left"):
		velocity.x += 1
		# if on cloud
			# $AnimatedSprite2D.animation = "idle"
		# else
			# $AnimatedSprite2D.animation = "falling"
		
	#if up is pressed
		#if player is on cloud
		#velocity.y -= 1
		#set animation to falling
			
			
	if velocity.x == -1:
		# if on cloud
		$AnimatedSprite2D.animation = "walk_left"
		
			
			
	if velocity.x == 1:
		#if on cloud
		$AnimatedSprite2D.animation = "walk_right"
		

	if velocity.length() > 0:
		velocity = velocity * speed
		
	
	if (position.y < currYPosition):
		if ($AnimatedSprite2D.animation != "idle"):
			$AnimatedSprite2D.animation = "idle"
	else:
		$AnimatedSprite2D.animation = "falling"
	
	
	
	position += velocity * delta
	position.x = clamp(position.x, -25, screen_size.x-50)
	
	currYPosition = position.y
	
	


	
