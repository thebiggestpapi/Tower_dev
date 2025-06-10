extends Area2D
@onready var get_turret_upgr = get_tree().root.get_node(
"Main/Turrets/Canon_turret/Canon_turret_upgrade/Canon_turret_upgrade_area")
@onready var canon_speed = get_turret_upgr.canon_speed
var canon_explosion = preload("res://Scenes/Projectiles/canon_proj_explosion.tscn")
var canon_explosion_animation = preload("res://Scenes/Projectiles/canon_explosion_animation.tscn")
@onready var projectiles = get_tree().get_root().get_node("Main/Projectiles")

var last_known_position: Vector2
var target: Area2D

func set_target_arrow(t):
	target = t

func _physics_process(delta: float) -> void:
	if target and is_instance_valid(target):
		last_known_position = target.global_position
		global_position = global_position.move_toward(
			last_known_position, canon_speed * delta)
	else:
		global_position = global_position.move_toward(
			last_known_position, canon_speed * delta)
	explosion(last_known_position)
	canon_destroyed()

func canon_destroyed():
	if global_position.is_equal_approx(last_known_position):
		self.queue_free()

func explosion(last_known_position):
	if global_position.is_equal_approx(last_known_position):
		var explosion_instance = canon_explosion.instantiate()
		projectiles.add_child(explosion_instance)
		explosion_instance.global_position = last_known_position
		explosion_anim()
		
func explosion_anim():
	var explosion_animation = canon_explosion_animation.instantiate()
	projectiles.add_child(explosion_animation)
	explosion_animation.global_position = last_known_position
