extends Area2D

@onready var projectiles = get_tree().get_root().get_node("Main/Projectiles")
var arrow = preload("res://Scenes/Projectiles/archer_proj.tscn")
var current_target: Area2D
@onready var arrow_shoot_cd: Timer = $"../Arrow_shoot_cd"
var is_on_cd = false

var enemy_prio_order: Array = []

func _physics_process(delta: float) -> void:
	if current_target:
		var target_position = current_target.global_position
		if !is_on_cd:
			archer_shoot()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		assign_order(area)
		if current_target == null:
			current_target = area

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		enemy_killed()

func assign_order(area):
	if enemy_prio_order.size() > 0 and is_instance_valid(enemy_prio_order[0]):
		current_target = enemy_prio_order[0]
		current_target.set_collision_mask_value(3, true)
	else:
		current_target = null
	enemy_prio_order.append(area)

func archer_shoot():
	is_on_cd = true
	var arrow_instance = arrow.instantiate()
	projectiles.add_child(arrow_instance)
	arrow_instance.global_position = Vector2(802, 447)
	arrow_instance.set_target_arrow(current_target)
	arrow_shoot_cd.start()

func _on_arrow_shoot_cd_timeout() -> void:
	is_on_cd = false

func enemy_killed():
	enemy_prio_order.pop_front()
	if enemy_prio_order.size() > 0 and is_instance_valid(enemy_prio_order[0]):
		current_target = enemy_prio_order[0]
	else:
		return
