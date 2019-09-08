extends Node

export (PackedScene) var enemy
var score

func _ready():
	randomize()

func new_game():
	score = 0
	$Player.start($start_position.position)
	$Play_timer.start()
	$background.show_message("Ready!")
	$background.update_score(score)
	$Background_music.play()

#Game Over
func _on_Player_hit():
	$Score_timer.stop()
	$Enemy_timer.stop()
	$background.game_over()
	$Background_music.stop()
	$GameOver.play()	

func _on_Play_timer_timeout():
	$Score_timer.start()
	$Enemy_timer.start()


func _on_Score_timer_timeout():
	score += 1
	$background.update_score(score)

func _on_Enemy_timer_timeout():
	$Enemy_path/enemy_position.set_offset(randi())
	
	var stone = enemy.instance()
	add_child(stone)
	
	var direction = $Enemy_path/enemy_position.rotation + PI/2
	
	stone.position = $Enemy_path/enemy_position.position
	
	direction += rand_range(-PI/4, PI/4)
	stone.rotation = direction
	stone.set_linear_velocity(Vector2(rand_range(stone.min_speed, stone.max_speed), 0).rotated(direction))
	
	
	
	
	
	
	
	
	
	
	
	