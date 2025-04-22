extends CharacterBody2D

@export var SPEED = 80
var dir_number: int

func _ready() -> void:
	await get_tree().process_frame
	direction_setting()

func direction_setting():
	if global_position.x <= 1000:
		dir_number = 1
	else:
		dir_number = -1

func _physics_process(delta: float) -> void:
	velocity.x = SPEED * dir_number
	move_and_slide()
	
	if not is_on_floor():
		velocity += get_gravity() * delta
