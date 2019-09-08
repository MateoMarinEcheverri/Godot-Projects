extends Area2D

export (int) var speed
var movement = Vector2()
var bounds
signal hit

func _ready():
	hide()
	$player_sprite.playing = true
	bounds = get_viewport_rect().size
	
func _process(delta):
	movement = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		movement.x += 1
		
	if Input.is_action_pressed("ui_left"):
		movement.x -= 1
		
	if Input.is_action_pressed("ui_up"):
		movement.y -= 1
		
	if Input.is_action_pressed("ui_down"):
		movement.y += 1
		
	if movement.length() > 0:
		movement = movement.normalized() * speed
		
	position += movement * delta
	position.x = clamp(position.x, 0, bounds.x)
	position.y = clamp(position.y, 0, bounds.y)
	
	if movement != Vector2(0,0):
		$player_sprite.animation = "run"
		$player_sprite.flip_h = movement.x < 0
	else:
		$player_sprite.animation = "idle"

func _on_Player_body_entered(body): #Collision
	hide()
	emit_signal("hit")
	$player_collision.disabled = true
	
func start(pos):
	position = pos
	show()
	$player_collision.disabled = false










