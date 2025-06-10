extends Area2D

@onready var get_turret_upgr = get_tree().root.get_node(
"Main/Turrets/Canon_turret/Canon_turret_upgrade/Canon_turret_upgrade_area")
@onready var canon_speed = get_turret_upgr.canon_speed

var last_known_position: Vector2
var target: Area2D

func set_target_arrow(t):
	target = t

func _physics_process(delta: float) -> void:
	if target and is_instance_valid(target):
		last_known_position = target.global_position
		global_position = global_position.move_toward(
			last_known_position, canon_speed * delta)
	else:
		global_position = global_position.move_toward(
			last_known_position, canon_speed * delta)
	arrow_destroyed()

func arrow_destroyed():
	if global_position.is_equal_approx(last_known_position):
		self.queue_free()
