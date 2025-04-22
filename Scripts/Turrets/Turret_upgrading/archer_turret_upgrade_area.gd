extends Area2D

var clickable = false
var arrow_speed: float = 320
var arrow_damage: float = 6

func _on_mouse_entered() -> void:
	clickable = true

func _process(delta: float) -> void:
	if clickable:
		if Input.is_action_just_pressed("lmb"):
			print("upgraded")
			upgrade_turret()

func _on_mouse_exited() -> void:
	clickable = false

func upgrade_turret():
	var get_arrow_cd = get_tree().root.get_node(
	"Main/Turrets/Archer_turret/Archer_turret_area").arrow_shoot_cd
	get_arrow_cd.wait_time -= 0.05
	arrow_speed += 0.5
	arrow_damage += 0.5
