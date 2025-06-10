extends Area2D

func _ready():
	await get_tree().create_timer(0.05).timeout
	get_parent().remove_child(self)
