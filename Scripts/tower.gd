extends Node2D

@export var HEALTH = 1000
@export var enemy1_damage = 5
@export var enemy2_damage = 15
@export var enemy3_damage = 7

func take_damage_enemy1():
	HEALTH -= enemy1_damage
	if HEALTH <= 0:
		tower_destroyed()

func take_damage_enemy2():
	HEALTH -= enemy2_damage
	if HEALTH <= 0:
		tower_destroyed()
	
func take_damage_enemy3():
	HEALTH -= enemy3_damage
	if HEALTH <= 0:
		tower_destroyed()

func tower_destroyed():
	pass #nejak zastavit vsechny dosavadni sceny a premistit se na game over screen
