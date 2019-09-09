extends Node2D

onready var global = Global

var y_speed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	position.y += y_speed


func _on_Area2D_area_entered(area):
	if get_node("Area2D").areaType == area.areaType:
		queue_free()
	
