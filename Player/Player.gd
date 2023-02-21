"""Player script."""
extends KinematicBody2D

const speed: int = 200


func _process(_delta: float) -> void:
	"""
	Processing on each frame.

	:param _delta: float: Time since last frame.
	"""
	var velocity: Vector2 = Vector2.ZERO

	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1

	# move_and_slide() applies delta automatically
	var _velocity: Vector2 = move_and_slide(velocity.normalized() * speed)

	player_animation(velocity)


# func _input(event):  # TODO: replace _process by this one?
# 	if event is InputEventJoypadMotion:
# 		print(
# 			(
# 				"Device: %s. Joypad Axis Index: %s. Strength: %s."
# 				% [event.device, event.axis, event.axis_value]
# 			)
# 		)

# 	if event is InputEventJoypadButton:
# 		# Input.start_joy_vibration(0, 0, 1, 0.5)
# 		print("Device: %s. Joypad Button Index: %s." % [event.device, event.button_index])


func player_animation(velocity: Vector2) -> void:
	"""
	Plays the correct animation based on the player's velocity on each axis.

	:param velocity: Vector2: The player's velocity on each axis.
	"""
	if velocity.y > 0:
		$"AnimatedSprite".play("walk_down")
	elif velocity.y < 0:
		$"AnimatedSprite".play("walk_up")

	elif velocity.x != 0:
		$"AnimatedSprite".play("walk_side")
		$"AnimatedSprite".flip_h = velocity.x > 0
	else:
		$"AnimatedSprite".stop()
		$"AnimatedSprite".frame = 0
