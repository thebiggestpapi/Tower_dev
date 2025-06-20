extends Area2D

@onready var turret_info_railgun: CanvasLayer = $"../Turret_info_railgun"
var is_unlocked = false
var is_clickable = false
var is_purchasable: bool

var railgun_speed: float = 800
var railgun_damage: float = 15
@onready var unlock_cost_railgun = 200
@onready var upgrade_cost_railgun: float = 50 #temporary

signal upgraded_railgun(upgrade_cost_railgun)
signal unlocked_railgun(unlock_cost_railgun)

func _process(delta: float) -> void:
		turret_upgrades()

func turret_upgrades():
	var current_gold = get_tree().root.get_node("Main/Gold/Gold_system/Gold_display").gold_count
	if current_gold >= upgrade_cost_railgun:
		is_purchasable = true
	else:
		is_purchasable = false
	if is_clickable:
		if Input.is_action_just_pressed("lmb") and is_purchasable and is_unlocked:
			print("upgraded_railgun")
			upgrade_turret(current_gold)
		elif Input.is_action_just_pressed("lmb") and current_gold >= unlock_cost_railgun and !is_unlocked:
			emit_signal("unlocked_railgun", unlock_cost_railgun)
			is_unlocked = true
			print("unlocked_railgun")

func _on_mouse_entered() -> void:
	is_clickable = true
	Input.set_default_cursor_shape(2)
	turret_info_railgun.show()

func _on_mouse_exited() -> void:
	is_clickable = false
	Input.set_default_cursor_shape(0)
	turret_info_railgun.hide()

func upgrade_turret(current_gold):
	var get_railgun_cd = get_tree().root.get_node(
	"Main/Turrets/Railgun_turret/Railgun_turret_area").railgun_shoot_cd
	if get_railgun_cd.wait_time > 0.2:
		get_railgun_cd.wait_time -= 0.11
	else: return
	railgun_speed += 40
	railgun_damage += 15
	
	emit_signal("upgraded_railgun", upgrade_cost_railgun)
	upgrade_cost_railgun = snapped(upgrade_cost_railgun * 1.8, 0)
	print(upgrade_cost_railgun)
