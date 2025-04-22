extends Area2D
@onready var enemy_3_attack_cd: Timer = $"../Enemy3_attack_cd"
@export var HEALTH = 10
@onready var enemy_3: CharacterBody2D = $".."

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Tower_area"):
		enemy3_attack()
	elif area.is_in_group("Arrow") and is_instance_valid(area):
		get_hit_arrow()
	elif area.is_in_group("Railgun") and is_instance_valid(area):
		get_hit_railgun()
	elif area.is_in_group("Magic") and is_instance_valid(area):
		get_hit_magic()
	elif area.is_in_group("Canon") and is_instance_valid(area):
		get_hit_canon()

func get_hit_arrow():
	var get_arrow = get_tree().get_root().get_node(
		"Main/Turrets/Archer_turret/Archer_turret_upgrade/Archer_turret_upgrade_area")
	HEALTH -= get_arrow.arrow_damage
	#animace chybi
	if HEALTH <= 0:
		enemy_death()

func get_hit_railgun():
	var get_railgun = get_tree().get_root().get_node("Main/Projectiles/Railgun_proj_area")
	HEALTH -= get_railgun.railgun_dmg
	#animace chybi
	if HEALTH <= 0:
		enemy_death()
	get_railgun.railgun_destroyed()

func get_hit_magic():
	var get_magic = get_tree().get_root().get_node("Main/Projectiles/Magic_proj_area")
	HEALTH -= get_magic.magic_dmg
	#animace chybi
	if HEALTH <= 0:
		enemy_death()
	get_magic.magic_destroyed()

func get_hit_canon():
	var get_canon = get_tree().get_root().get_node("Main/Projectiles/Canon_proj_area")
	HEALTH -= get_canon.canon_dmg
	#animace chybi
	if HEALTH <= 0:
		enemy_death()
	get_canon.canon_destroyed()

func enemy3_attack():
	var tower = get_tree().get_root().get_node("Main/Environment/Tower")
	tower.take_damage_enemy3()
	enemy_3_attack_cd.start()

func _on_enemy_3_attack_cd_timeout() -> void:
	enemy3_attack()

func enemy_death():
	enemy_3.queue_free()
