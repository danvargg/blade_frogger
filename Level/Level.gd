extends Node

const CAR = preload("res://Car/Car.tscn")


func _on_Timer_timeout():  # FIXME: this did not work
	var car: Node = CAR.instance()
	car.position = $"CarStart1".position
	add_child(car)
