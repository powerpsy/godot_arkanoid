extends CharacterBody2D

const SPEED = 50

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN

func _physics_process(delta):
	var vel : Vector2 = (get_global_mouse_position() - self.position)
	vel.y = 0
	velocity = vel * SPEED
	move_and_slide()
