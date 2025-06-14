extends Area2D

@onready var turret_info_archer: CanvasLayer = $"../Turret_info_archer"
var is_unlocked = false
var is_clickable = false
var is_purchasable: bool

var arrow_speed: float = 520
var arrow_damage: float = 8
@onready var unlock_cost_archer = 200
@onready var upgrade_cost_archer: float = 50 #temporary

signal upgraded_archer(upgrade_cost_archer)
signal unlocked_archer(unlocked_cost_archer)

func _process(delta: float) -> void:
	var current_gold = get_tree().root.get_node("Main/Gold/Gold_system/Gold_display").gold_count
	if current_gold >= upgrade_cost_archer:
		is_purchasable = true
	else:
		is_purchasable = false
	if is_clickable:
		if Input.is_action_just_pressed("lmb") and is_purchasable and is_unlocked:
			print("upgraded_archer")
			upgrade_turret(current_gold)
		elif Input.is_action_just_pressed("lmb") and current_gold >= unlock_cost_archer and !is_unlocked:
			emit_signal("unlocked_archer", unlock_cost_archer)
			is_unlocked = true
			print("unlocked_archer")

func _on_mouse_entered() -> void:
	is_clickable = true
	Input.set_default_cursor_shape(2)
	turret_info_archer.show()

func _on_mouse_exited() -> void:
	is_clickable = false
	Input.set_default_cursor_shape(0)
	turret_info_archer.hide()

func upgrade_turret(current_gold):
	var get_arrow_cd = get_tree().root.get_node(
	"Main/Turrets/Archer_turret/Archer_turret_area").arrow_shoot_cd
	if get_arrow_cd.wait_time > 0.1:
		get_arrow_cd.wait_time -= 0.15
	else: return
	arrow_speed += 20
	arrow_damage += 8
	
	emit_signal("upgraded_archer", upgrade_cost_archer)
	upgrade_cost_archer = snapped(upgrade_cost_archer * 1.2, 0)
	print(upgrade_cost_archer)
