extends Node2D

var near = ""

func _ready() -> void:
	$Background/Tengu/Tengu.animation = "looking"

func _process(delta: float) -> void:
	$Background/Tengu/Tengu.frame = 0 if $Background/HomebaseRonin.global_position.x > $Background/Tengu/Tengu.global_position.x else 1
	if Input.is_action_just_pressed("interact"):
		match near:
			"gacha":
				$Gacha.visible = true
				$Background/HomebaseRonin.moveable = false
				near = "in gacha"
			"in gacha":
				$Gacha.spin()

func _on_gacha_play_area_entered(area: Area2D) -> void:
	near = "gacha"
	
func _on_gacha_play_area_exited(area: Area2D) -> void:
	near = ""

func exit_gacha():
	near = "gacha"
	$Gacha.visible = false
	$Background/HomebaseRonin.moveable = true


func _on_exit_gacha_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	print(near)
	if near == "in gacha":
		if event is InputEventMouseButton:
			print("mouse")
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				exit_gacha()
