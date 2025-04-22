extends Area2D
@onready var enemy_1_attack_cd: Timer = $"../Enemy1_attack_cd"
@onready var enemy_1: CharacterBody2D = $".."
@export var HEALTH = 15

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Tower_area"):
		enemy1_attack()
	elif area.is_in_group("Arrow") and is_instance_valid(area):
		get_hit_arrow()
	elif area.is_in_group("Railgun") and is_instance_valid(area):
		get_hit_railgun()
	elif area.is_in_group("Magic") and is_instance_valid(area):
		get_hit_magic()
	elif area.is_in_group("Canon") and is_instance_valid(area):
		get_hit_canon()

func get_hit_arrow():
	var get_arrow = get_tree().root.get_node(
	"Main/Turrets/Archer_turret/Archer_turret_upgrade/Archer_turret_upgrade_area")
	HEALTH -= get_arrow.arrow_damage
	#animace chyb
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

func enemy1_attack():
	var tower = get_tree().get_root().get_node("Main/Environment/Tower")
	tower.take_damage_enemy1()
	enemy_1_attack_cd.start()

func _on_enemy_1_attack_cd_timeout() -> void:
	enemy1_attack()

func enemy_death():
	enemy_1.queue_free()
