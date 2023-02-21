extends Area2D

var car_speed: int = 250


func _process(delta):
	position.x -= car_speed * delta


func _on_Car_body_entered(body):
	get_tree().change_scene("res://GameScreen/GameScreen.tscn")


func _on_Car_body_exited(body):
	print("collision")
