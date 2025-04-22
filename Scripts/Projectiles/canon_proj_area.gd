extends Area2D

@export var canon_dmg = 4
var target: Area2D

func set_target_canon(t):
	target = t

func _physics_process(delta: float) -> void:
	if target:
		global_position = global_position.move_toward(target.global_position, 20)
	else:
		canon_destroyed()

func canon_destroyed():
	queue_free()
