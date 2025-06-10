extends Area2D

var clickable = false
var magic_speed: float = 320
var magic_damage: float = 0

func _on_mouse_entered() -> void:
	clickable = true
	Input.set_default_cursor_shape(2)

func _process(delta: float) -> void:
	if clickable:
		if Input.is_action_just_pressed("lmb"):
			print("upgraded_magic")
			upgrade_turret()

func _on_mouse_exited() -> void:
	clickable = false
	Input.set_default_cursor_shape(0)

func upgrade_turret():
	var get_magic_cd = get_tree().root.get_node(
	"Main/Turrets/Magic_turret/Magic_turret_area").magic_shoot_cd
	if get_magic_cd.wait_time > 0.2:
		get_magic_cd.wait_time -= 0.05
	else: return
	magic_speed += 0.5
	magic_damage += 0.5
