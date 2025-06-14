extends Area2D
@onready var projectiles = get_tree().get_root().get_node("Main/Projectiles")
var railgun = preload("res://Scenes/Projectiles/railgun_proj.tscn")
var current_target: Area2D
@onready var railgun_shoot_cd: Timer = $"../Railgun_shoot_cd"
var is_on_cd: bool = false
@onready var get_unlock_status = get_tree().root.get_node(
	"Main/Turrets/Railgun_turret/Railgun_turret_upgrade/Railgun_turret_upgrade_area")
var enemy_prio_order: Array = []

func _physics_process(delta: float) -> void:
	if current_target != null and is_instance_valid(current_target):
		var target_position = current_target.global_position
		if !is_on_cd and get_unlock_status.is_unlocked == true:
			railgun_shoot()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		assign_order(area)
		if current_target == null:
			current_target = area

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		enemy_killed(area)

func assign_order(area):
	if enemy_prio_order.size() > 0 and is_instance_valid(enemy_prio_order[0]):
		current_target = enemy_prio_order[0]
		current_target.is_shootable_railgun = true
	else:
		current_target = null
	enemy_prio_order.append(area)

func railgun_shoot():
	is_on_cd = true
	var railgun_instance = railgun.instantiate()
	projectiles.add_child(railgun_instance)
	railgun_instance.global_position = Vector2(1133, 556)
	railgun_instance.set_target_arrow(current_target)
	railgun_shoot_cd.start()

func _on_railgun_shoot_cd_timeout() -> void:
	is_on_cd = false

func enemy_killed(area):
	if area == current_target:
		current_target = null
	enemy_prio_order.pop_front()
	if enemy_prio_order.size() > 0 and is_instance_valid(enemy_prio_order[0]):
		current_target = enemy_prio_order[0]
		current_target.is_shootable_railgun = true
	else:
		return
