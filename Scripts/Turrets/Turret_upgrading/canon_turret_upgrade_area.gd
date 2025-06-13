extends Area2D

var is_clickable = false
var is_purchasable: bool
var canon_speed: float = 320
var canon_damage: float = 2
@onready var upgrade_cost_canon: float = 50 #temporary

signal upgraded_canon(upgrade_cost_canon)

func _on_mouse_entered() -> void:
	is_clickable = true
	Input.set_default_cursor_shape(2)

func _process(delta: float) -> void:
	var current_gold = get_tree().root.get_node("Main/Gold/Gold_system/Gold_display").gold_count
	if current_gold >= upgrade_cost_canon:
		is_purchasable = true
	else:
		is_purchasable = false
	if is_clickable:
		if Input.is_action_just_pressed("lmb") and is_purchasable:
			print("upgraded_canon")
			upgrade_turret(current_gold)
			

func _on_mouse_exited() -> void:
	is_clickable = false
	Input.set_default_cursor_shape(0)

func upgrade_turret(current_gold):
	var get_canon_cd = get_tree().root.get_node(
	"Main/Turrets/Canon_turret/Canon_turret_area").canon_shoot_cd
	if get_canon_cd.wait_time > 0.2:
		get_canon_cd.wait_time -= 0.05
	else: return
	canon_speed += 0.5
	canon_damage += 0.5
	
	emit_signal("upgraded_canon", upgrade_cost_canon)
	upgrade_cost_canon = snapped(upgrade_cost_canon * 1.2, 0)
	print(upgrade_cost_canon)
