extends Area2D
signal onCloud

@export var speed = 400
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.animation = "idle"
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	
	# if on cloud
		# set velocity.y to velocity of cloud
	# else
		# velocity.y = 0.5
	
	velocity.y = 0.5
	
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
	if velocity.x == 0:
		# if on cloud
		$AnimatedSprite2D.animation = "idle"
		# else
			# $AnimatedSprite2D.animation = "falling"
	if velocity.x == 1:
		#if on cloud
		$AnimatedSprite2D.animation = "walk_right"
		

	if velocity.length() > 0:
		velocity = velocity * speed
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	

	
