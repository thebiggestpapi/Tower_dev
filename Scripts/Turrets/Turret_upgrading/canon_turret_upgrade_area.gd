extends Area2D

@onready var turret_info_canon: CanvasLayer = $"../Turret_info_canon"
var is_unlocked = false
var is_clickable = false
var is_purchasable: bool

var canon_speed: float = 320
var canon_damage: float = 10
@onready var unlock_cost_canon = 200
@onready var upgrade_cost_canon: float = 50 #temporary

signal upgraded_canon(upgrade_cost_canon)
signal unlocked_canon(unlock_cost_canon)

func _process(delta: float) -> void:
	var current_gold = get_tree().root.get_node("Main/Gold/Gold_system/Gold_display").gold_count
	if current_gold >= upgrade_cost_canon:
		is_purchasable = true
	else:
		is_purchasable = false
	if is_clickable:
		if Input.is_action_just_pressed("lmb") and is_purchasable and is_unlocked:
			print("upgraded_canon")
			upgrade_turret(current_gold)
		elif Input.is_action_just_pressed("lmb") and current_gold >= unlock_cost_canon and !is_unlocked:
			emit_signal("unlocked_canon", unlock_cost_canon)
			is_unlocked = true
			print("unlocked_canon")

func _on_mouse_entered() -> void:
	is_clickable = true
	Input.set_default_cursor_shape(2)
	turret_info_canon.show()

func _on_mouse_exited() -> void:
	is_clickable = false
	Input.set_default_cursor_shape(0)
	turret_info_canon.hide()

func upgrade_turret(current_gold):
	var get_canon_cd = get_tree().root.get_node(
	"Main/Turrets/Canon_turret/Canon_turret_area").canon_shoot_cd
	if get_canon_cd.wait_time > 0.4:
		get_canon_cd.wait_time -= 0.1
	else: return
	canon_speed += 15
	canon_damage += 15
	
	emit_signal("upgraded_canon", upgrade_cost_canon)
	upgrade_cost_canon = snapped(upgrade_cost_canon * 1.8, 0)
	print(upgrade_cost_canon)
