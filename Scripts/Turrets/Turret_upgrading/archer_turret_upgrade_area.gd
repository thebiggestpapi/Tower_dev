extends Area2D

var clickable = false
var is_purchasable: bool
var arrow_speed: float = 320
var arrow_damage: float = 2
@onready var upgrade_cost: float = 50 #temporary

signal upgraded_archer(upgrade_cost)

func _on_mouse_entered() -> void:
	clickable = true
	Input.set_default_cursor_shape(2)

func _process(delta: float) -> void:
	var current_gold = get_tree().root.get_node("Main/Gold/Gold_system/Gold_display").gold_count
	if current_gold >= upgrade_cost:
		is_purchasable = true
	else:
		is_purchasable = false
	if clickable:
		if Input.is_action_just_pressed("lmb") and is_purchasable:
			print("upgraded_archer")
			upgrade_turret(current_gold)

func _on_mouse_exited() -> void:
	clickable = false
	Input.set_default_cursor_shape(0)

func upgrade_turret(current_gold):
	var get_arrow_cd = get_tree().root.get_node(
	"Main/Turrets/Archer_turret/Archer_turret_area").arrow_shoot_cd
	if get_arrow_cd.wait_time > 0.2:
		get_arrow_cd.wait_time -= 0.05
	else: return
	arrow_speed += 0.5
	arrow_damage += 0.5
	
	emit_signal("upgraded_archer", upgrade_cost)
	upgrade_cost = snapped(upgrade_cost * 1.2, 0)
	print(upgrade_cost)
