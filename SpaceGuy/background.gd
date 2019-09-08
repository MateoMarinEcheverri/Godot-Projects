extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$message_timer.start()
	
func game_over():
	show_message("Game Over")
	yield($message_timer, "timeout")
	
	$Play_button.show()
	$Message.text = "Space Guy"
	$Message.show()
	
func update_score(score):
	$Score_label.text = str(score)

func _on_message_timer_timeout():
	$Message.hide()


func _on_Play_button_pressed():
	$Play_button.hide()
	emit_signal("start_game")
