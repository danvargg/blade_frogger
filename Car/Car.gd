extends Area2D

const CAR_LIST = ["Grey1", "Grey2", "Yellow1", "Yellow2"]  # TODO: typing
# TODO: doc constants and vars

var CAR_SPEED: int = 200  # TODO: these are not constants!!!!
var DIRECTION: int = 1


func _ready() -> void:
	randomize()
	var current_car: String = CAR_LIST[randi() % CAR_LIST.size()]

	$"AnimatedSprite".animation = current_car

	if position.x < 0:
		DIRECTION = -1
		$"AnimatedSprite".flip_h = true
	else:
		DIRECTION = 1


func _process(delta) -> void:
	"""
	Process function

	:param delta: Delta time
	"""

	position.x -= CAR_SPEED * delta * DIRECTION


func _on_Car_body_entered(_body) -> void:
	var _game_screen = get_tree().change_scene("res://GameScreen/GameScreen.tscn")
