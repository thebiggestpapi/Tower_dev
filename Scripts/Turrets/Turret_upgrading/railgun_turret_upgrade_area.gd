extends Area2D

var clickable = false
var railgun_speed: float = 320
var railgun_damage: float = 6

func _on_mouse_entered() -> void:
	clickable = true
	Input.set_default_cursor_shape(2)

func _process(delta: float) -> void:
	if clickable:
		if Input.is_action_just_pressed("lmb"):
			print("upgraded_railgun")
			upgrade_turret()

func _on_mouse_exited() -> void:
	clickable = false
	Input.set_default_cursor_shape(0)

func upgrade_turret():
	var get_railgun_cd = get_tree().root.get_node(
	"Main/Turrets/Railgun_turret/Railgun_turret_area").railgun_shoot_cd
	if get_railgun_cd.wait_time > 0.2:
		get_railgun_cd.wait_time -= 0.05
	else: return
	railgun_speed += 0.5
	railgun_damage += 0.5
