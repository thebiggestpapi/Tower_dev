extends Area2D

var is_clickable = false
var is_purchasable: bool
var magic_speed: float = 320
var magic_damage: float = 2
@onready var upgrade_cost_magic: float = 50 #temporary

signal upgraded_magic(upgrade_cost_magic)

func _on_mouse_entered() -> void:
	is_clickable = true
	Input.set_default_cursor_shape(2)

func _process(delta: float) -> void:
	var current_gold = get_tree().root.get_node("Main/Gold/Gold_system/Gold_display").gold_count
	if current_gold >= upgrade_cost_magic:
		is_purchasable = true
	else:
		is_purchasable = false
	if is_clickable:
		if Input.is_action_just_pressed("lmb") and is_purchasable:
			print("upgraded_magic")
			upgrade_turret(current_gold)

func _on_mouse_exited() -> void:
	is_clickable = false
	Input.set_default_cursor_shape(0)

func upgrade_turret(current_gold):
	var get_magic_cd = get_tree().root.get_node(
	"Main/Turrets/Magic_turret/Magic_turret_area").magic_shoot_cd
	if get_magic_cd.wait_time > 0.2:
		get_magic_cd.wait_time -= 0.05
	else: return
	magic_speed += 0.5
	magic_damage += 0.5
	
	emit_signal("upgraded_magic", upgrade_cost_magic)
	upgrade_cost_magic = snapped(upgrade_cost_magic * 1.2, 0)
	print(upgrade_cost_magic)
