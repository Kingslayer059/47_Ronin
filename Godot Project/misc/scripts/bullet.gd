extends CharacterBody2D

@export var speed = -300

var direction : float
var up : bool
var spwnPos : Vector2

func _ready() -> void:
	global_position = spwnPos
	rotation_degrees = 90 if up else 0
	
func _physics_process(delta: float) -> void:
	if up:
		position.y += speed * delta * direction
	else:
		position.x += speed * delta * direction
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	queue_free()
