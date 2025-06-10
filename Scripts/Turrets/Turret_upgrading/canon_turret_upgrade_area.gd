extends Area2D

var clickable = false
var canon_speed: float = 320
var canon_damage: float = 6

func _on_mouse_entered() -> void:
	clickable = true

func _process(delta: float) -> void:
	if clickable:
		if Input.is_action_just_pressed("lmb"):
			print("upgraded_canon")
			upgrade_turret()

func _on_mouse_exited() -> void:
	clickable = false

func upgrade_turret():
	var get_canon_cd = get_tree().root.get_node(
	"Main/Turrets/Canon_turret/Canon_turret_area").canon_shoot_cd
	if get_canon_cd.wait_time > 0.2:
		get_canon_cd.wait_time -= 0.05
	else: return
	canon_speed += 0.5
	canon_damage += 0.5
