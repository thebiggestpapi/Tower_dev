extends Area2D
@onready var enemy_2_attack_cd: Timer = $"../Enemy2_attack_cd"
@onready var enemy_2: CharacterBody2D = $".."
@export var HEALTH = 15
@onready var is_shootable_archer = false
@onready var is_shootable_railgun = false

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Tower_area"):
		enemy2_attack()

	elif area.is_in_group("Arrow") and is_instance_valid(area) and is_shootable_archer:
		get_hit_arrow()
	elif area.is_in_group("Railgun") and is_instance_valid(area) and is_shootable_railgun:
		get_hit_railgun()
	elif area.is_in_group("Magic") and is_instance_valid(area):
		get_hit_magic()
	elif area.is_in_group("Canon_explosion") and is_instance_valid(area):
		get_hit_canon()

func get_hit_arrow():
	var get_arrow = get_tree().root.get_node(
	"Main/Turrets/Archer_turret/Archer_turret_upgrade/Archer_turret_upgrade_area")
	HEALTH -= get_arrow.arrow_damage
	#animace chybi
	if HEALTH <= 0:
		enemy_death()

func get_hit_canon():
	var get_canon = get_tree().root.get_node(
	"Main/Turrets/Canon_turret/Canon_turret_upgrade/Canon_turret_upgrade_area")
	HEALTH -= get_canon.canon_damage
	#animace chybi
	if HEALTH <= 0:
		enemy_death()

func get_hit_railgun():
	var get_railgun = get_tree().root.get_node(
	"Main/Turrets/Railgun_turret/Railgun_turret_upgrade/Railgun_turret_upgrade_area")
	HEALTH -= get_railgun.railgun_damage
	#animace chybi
	if HEALTH <= 0:
		enemy_death()

func get_hit_magic():
	var get_magic = get_tree().root.get_node(
	"Main/Turrets/Magic_turret/Magic_turret_upgrade/Magic_turret_upgrade_area")
	HEALTH -= get_magic.magic_damage
	#animace chybi
	if HEALTH <= 0:
		enemy_death()

func enemy2_attack():
	var tower = get_tree().get_root().get_node("Main/Environment/Tower")
	tower.take_damage_enemy1()
	enemy_2_attack_cd.start()

func _on_enemy_2_attack_cd_timeout() -> void:
	enemy2_attack()

func enemy_death():
	var gold_reward2 = 70
	SignalBus.enemy2_died.emit(gold_reward2)
	enemy_2.queue_free()
