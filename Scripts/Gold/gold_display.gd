extends CanvasLayer
@onready var gold_count_text: Label = $Gold_count_text

var gold_count = 0

func _ready():
	gold_count_text.text = str(gold_count)
	var archer = get_tree().root.get_node("Main/Turrets/Archer_turret/Archer_turret_upgrade/Archer_turret_upgrade_area")
	var canon = get_tree().root.get_node("Main/Turrets/Canon_turret/Canon_turret_upgrade/Canon_turret_upgrade_area")
	var railgun = get_tree().root.get_node("Main/Turrets/Railgun_turret/Railgun_turret_upgrade/Railgun_turret_upgrade_area")
	var magic = get_tree().root.get_node("Main/Turrets/Magic_turret/Magic_turret_upgrade/Magic_turret_upgrade_area")
	
	SignalBus.enemy1_died.connect(_on_enemy1_died)
	SignalBus.enemy2_died.connect(_on_enemy2_died)
	SignalBus.enemy3_died.connect(_on_enemy3_died)
	
	archer.upgraded_archer.connect(_on_upgraded_archer)
	canon.upgraded_canon.connect(_on_upgraded_canon)
	railgun.upgraded_railgun.connect(_on_upgraded_railgun)
	magic.upgraded_magic.connect(_on_upgraded_magic)

func _process(delta: float) -> void:
	gold_count_text.text = str(gold_count)

func _on_enemy1_died(gold_reward1: int):
	gold_count += gold_reward1
func _on_enemy2_died(gold_reward2: int):
	gold_count += gold_reward2
func _on_enemy3_died(gold_reward3: int):
	gold_count += gold_reward3

func _on_upgraded_archer(upgrade_cost_archer):
	gold_count -= upgrade_cost_archer
func _on_upgraded_canon(upgrade_cost_canon):
	gold_count -= upgrade_cost_canon
func _on_upgraded_railgun(upgrade_cost_railgun):
	gold_count -= upgrade_cost_railgun
func _on_upgraded_magic(upgrade_cost_magic):
	gold_count -= upgrade_cost_magic
