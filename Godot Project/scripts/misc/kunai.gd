extends CharacterBody2D

@export var speed = -300

var dir : float
var spwnPos : Vector2

func _ready() -> void:
	global_position = spwnPos
	
func _physics_process(delta: float) -> void:
	position.x += speed * delta * dir
	
