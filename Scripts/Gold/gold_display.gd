extends CanvasLayer
@onready var gold_count_text: Label = $Gold_count_text

var gold_count = 0

func _ready():
	gold_count_text.text = str(gold_count)
	var archer = get_tree().root.get_node("Main/Turrets/Archer_turret/Archer_turret_upgrade/Archer_turret_upgrade_area")
	
	SignalBus.enemy1_died.connect(_on_enemy1_died)
	SignalBus.enemy2_died.connect(_on_enemy2_died)
	SignalBus.enemy3_died.connect(_on_enemy3_died)
	
	archer.upgraded_archer.connect(_on_upgraded_archer)

func _on_enemy1_died(gold_reward1: int):
	gold_count += gold_reward1
	gold_count_text.text = str(gold_count)
func _on_enemy2_died(gold_reward2: int):
	gold_count += gold_reward2
	gold_count_text.text = str(gold_count)
func _on_enemy3_died(gold_reward3: int):
	gold_count += gold_reward3
	gold_count_text.text = str(gold_count)

func _on_upgraded_archer(upgrade_cost):
	gold_count -= upgrade_cost
