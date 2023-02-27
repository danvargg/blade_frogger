extends Node

const CAR = preload("res://Car/Car.tscn")


func _ready():
	$YSort/Player.position = $PlayerSytartPos.position


func car_spawn(start_pos: int):
	var car: Node = CAR.instance()
	var car_start_node_name = "StartPositions/CarStart" + str(start_pos)

	car.position = get_node(car_start_node_name).position
	$"YSort".add_child(car)

	var time_node_name = "CarTimers/Timer" + str(start_pos)
	get_node(time_node_name).wait_time = rand_range(1.6, 2.2)


func _process(_delta):
	if $"YSort/Player".position.y <= 80:  # FIXME: this does too early, also magic number
		$"YSort/Player".position = $"PlayerSytartPos".position
		Global.score += 1
		$"Win".play()
	$"CanvasLayer/TestScore".text = "Score: " + str(Global.score)


func _on_Timer1_timeout():
	car_spawn(1)


func _on_Timer2_timeout():
	car_spawn(2)


func _on_Timer4_timeout():
	car_spawn(3)


func _on_Timer5_timeout():
	car_spawn(4)


func _on_Timer3_timeout() -> void:
	car_spawn(5)
