extends SwordRonin

var moveable = true

func _ready():
	speed = 50
	var frames = $AnimatedSprite2D.sprite_frames
	for anim in frames.get_animation_names():
		var tex = frames.get_frame_texture(anim, 0)
		print(anim, " | ", tex, " | ", tex.get_class())

func _process(delta: float) -> void:
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walking")
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walking")
	else:
		$AnimatedSprite2D.play("breathing")

func _physics_process(delta):
	velocity.y += gravity * delta

	velocity.x = Input.get_axis("ui_left", "ui_right") * speed if moveable else 0
	
	move_and_slide()
