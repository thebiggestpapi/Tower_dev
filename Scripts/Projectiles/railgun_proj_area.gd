extends Area2D

@export var railgun_dmg = 6

var target: Area2D

func set_target_railgun(t):
	target = t

func _physics_process(delta: float) -> void:
	if target:
		global_position = global_position.move_toward(target.global_position, 20)
	else:
		railgun_destroyed()

func railgun_destroyed():
	queue_free()
