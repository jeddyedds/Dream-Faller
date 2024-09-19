extends Area2D

@export var speed = 400
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.animation = "falling"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	$AnimatedSprite2D.play()
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		$AnimatedSprite2D.animation = "walk_right"
		# if on cloud
			# $AnimatedSprite2D.animation = "walk_right"
		# else
			# $AnimatedSprite2D.animation = "falling"
	else:
		velocity.x -= 1
		$AnimatedSprite2D.animation = "idle"
		# if on cloud
			# $AnimatedSprite2D.animation = "idle"
		# else
			# $AnimatedSprite2D.animation = "falling"
		
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		# if on cloud
			# $AnimatedSprite2D.animation = "walk_left"
		# else
			# $AnimatedSprite2D.animation = "falling"
		
	if Input.is_action_just_released("move_left"):
		velocity.x += 1
		# if on cloud
			# $AnimatedSprite2D.animation = "idle"
		# else
			# $AnimatedSprite2D.animation = "falling"
		
		
	# if up is pressed
		#if player is on cloud
			#velocity.y -= 1
			#set animation to falling
			
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
