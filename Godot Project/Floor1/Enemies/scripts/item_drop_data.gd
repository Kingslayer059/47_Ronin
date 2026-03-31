class_name ItemDropData extends Resource

@export var item: ItemData
# probability of dropping item (0-100, default probability 100
@export_range(0, 100, 1, "suffix:%") var probability : float = 100
# how many items drop minimum, between 1 and 10
@export_range(1, 10, 1, "suffix:items") var min_amount: int = 1
# how many items drop maximum, between 1 and 10
@export_range(1, 10, 1, "suffix:items") var max_amount: int = 1

func get_drop_count() -> int:
	if randf_range(0, 100) >= probability:
		return 0
	return randi_range(min_amount, max_amount)
