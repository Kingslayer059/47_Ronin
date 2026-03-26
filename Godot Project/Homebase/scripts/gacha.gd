extends Node2D
var balls = ["blue", "green", "red", "orange", "purple", "yellow"]

func spin():
	$AnimatedSprite2D.play("spin")
	await $AnimatedSprite2D.animation_finished
	$AnimatedSprite2D.play(balls[RandomNumberGenerator.new().randi_range(0, 5)])
