extends Node2D

@onready var enemies: Node2D = $"../Enemies"
var enemy1_scene = preload("res://Scenes/Enemies/enemy_1.tscn")
var enemy2_scene = preload("res://Scenes/Enemies/enemy_2.tscn")
var enemy3_scene = preload("res://Scenes/Enemies/enemy_3.tscn")

var l = Vector2(-300, 900) #spawn_point_left
var r = Vector2(2220, 900) #spawn_point_right
var fl = Vector2(-300, 800)
var fr = Vector2(2220, 800)

var wave_number = 1
@onready var wave_timer: Timer = $Wave_timer

func _ready():
	wave_calling()
	wave_timer.start()

func _on_wave_timer_timeout() -> void: 
	wave_number += 1
	wave_calling()

func wave_calling():
	if wave_data.has(wave_number):
		var wave_info = wave_data[wave_number]
		spawn_wave(wave_info)

func spawn_wave(wave_info):
	for enemy_info in wave_info["enemies"]:
		var enemy_scene = enemy_info["scene"]
		for spawn in enemy_info["spawn_points"]:
			var enemy_instance = enemy_scene.instantiate()
			enemies.add_child(enemy_instance)
			enemy_instance.global_position = spawn
			await get_tree().create_timer(1).timeout

var wave_data = {
	1: {
		"enemies": [ #l = spawn_left, r = spawn_right, shortened for less clutter, fl/fr = flying_spawn_right/left
			{"scene": enemy1_scene, "spawn_points": [
				l, l, l,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
		]
	},
	2: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
		]
	},
	3: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r, l, r, l, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				l]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
		]
	},
	4: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r, l, r, l, r,l,l,l,r,r,r]},
			{"scene": enemy2_scene, "spawn_points": [
				r,l]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
			]
		},
	5: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				r,r,l,l]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	6: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r,l,r]},
			{"scene": enemy2_scene, "spawn_points": [
				r,r,l,l,r]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	7: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	8: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,l,l,r,r]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	9: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				fr,fr,fl,fl]},
				]
		},
	10: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	11: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	12: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	13: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	14: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	15: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	16: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	17: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	18: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	19: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	20: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
			]
		},
	21: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	22: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	23: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	24: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	25: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	26: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	27: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	28: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	29: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	30: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	31: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	32: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	33: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	34: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	35: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	36: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	37: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	38: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	39: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	40: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	41: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	42: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	43: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	44: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	45: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	46: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	47: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	48: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	49: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
				]
		},
	50: {"enemies": [
			{"scene": enemy1_scene, "spawn_points": [
				l, l, r, r, r,]},
			{"scene": enemy2_scene, "spawn_points": [
				]},
			{"scene": enemy3_scene, "spawn_points": [
				]},
			]
	},
}
