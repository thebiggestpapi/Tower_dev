extends AnimatedSprite2D

func _ready():
	await self.animation_finished
	get_parent().remove_child(self)
