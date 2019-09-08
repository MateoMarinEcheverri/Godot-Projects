extends RigidBody2D

export (int) var min_speed
export (int) var max_speed

func _ready():
	pass
	
func _process(delta):
	$enemy_sprite.play("animation")

func _on_enemy_visibility_screen_exited():
	queue_free() #elinima el enemigo
