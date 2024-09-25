extends Node2D

@export var scroll_speed = 2.0

func _ready() -> void:
	pass # Replace with function body.

func move():
	self.position.y-=scroll_speed
