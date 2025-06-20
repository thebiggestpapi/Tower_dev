extends Area2D

@onready var turret_info_magic: CanvasLayer = $"../Turret_info_magic"
var is_unlocked = false
var is_clickable = false
var is_purchasable: bool

var magic_speed: float = 450
var magic_damage: float = 8
@onready var upgrade_cost_magic: float = 50 #temporary
@onready var unlock_cost_magic = 200

signal upgraded_magic(upgrade_cost_magic)
signal unlocked_magic(unlock_cost_magic)

func _process(delta: float) -> void:
	var current_gold = get_tree().root.get_node("Main/Gold/Gold_system/Gold_display").gold_count
	if current_gold >= upgrade_cost_magic:
		is_purchasable = true
	else:
		is_purchasable = false
	if is_clickable:
		if Input.is_action_just_pressed("lmb") and is_purchasable and is_unlocked:
			print("upgraded_magic")
			upgrade_turret(current_gold)
		elif Input.is_action_just_pressed("lmb") and current_gold >= unlock_cost_magic and !is_unlocked:
			emit_signal("unlocked_magic", unlock_cost_magic)
			is_unlocked = true
			print("unlocked_magic")

func _on_mouse_entered() -> void:
	is_clickable = true
	Input.set_default_cursor_shape(2)
	turret_info_magic.show()

func _on_mouse_exited() -> void:
	is_clickable = false
	Input.set_default_cursor_shape(0)
	turret_info_magic.hide()

func upgrade_turret(current_gold):
	var get_magic_cd = get_tree().root.get_node(
	"Main/Turrets/Magic_turret/Magic_turret_area").magic_shoot_cd
	if get_magic_cd.wait_time > 0.2:
		get_magic_cd.wait_time -= 0.13
	else: return
	magic_speed += 40
	magic_damage += 8
	
	emit_signal("upgraded_magic", upgrade_cost_magic)
	upgrade_cost_magic = snapped(upgrade_cost_magic * 1.8, 0)
	print(upgrade_cost_magic)
