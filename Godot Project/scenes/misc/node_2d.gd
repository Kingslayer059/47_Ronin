extends Node2D

@onready var main = get_tree().get_root().get_node("TestFloor")
@onready var kunai = load("res://scenes/misc/kunai.tscn")


func throw(direction):
	var instance = kunai.instantiate()
	instance.dir = 1 if direction else -1
	instance.spwnPos = $KunaiRonin.global_position
	main.add_child.call_deferred(instance)
