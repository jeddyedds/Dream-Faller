extends Node2D
var random = RandomNumberGenerator.new()

@export var scroll_speed = randf_range(0.5, 4.0) #2.0

func _ready() -> void:
	self.position.x = randf_range(0, 550)

func move():
	self.position.y-=scroll_speed
	
func getSpeed():
	return scroll_speed
