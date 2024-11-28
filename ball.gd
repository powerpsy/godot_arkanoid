extends CharacterBody2D

@export var ball_speed = 150
var CollideBuffer = 0

func _ready():
	velocity = Vector2(30,-30).normalized() * ball_speed

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		CollideBuffer += 1
		if collision.get_collider().name == "Player" && CollideBuffer > 2:
			CollideBuffer = 0 
			var distance = collision.get_collider().position.x - position.x
			var width = get_parent().get_node("Player/SpritePlayer").get_rect().size.x/2
			var relation = distance/width
			var angle = relation * 45
			var angle_rad = -deg_to_rad(angle)
			velocity = velocity.bounce(collision.get_normal().rotated(angle_rad))
			velocity = velocity * 1.02
		if collision.get_collider().is_in_group("Blocks"):
			velocity = velocity.bounce(collision.get_normal())
			collision.get_collider().queue_free()
		else:
			velocity = velocity.bounce(collision.get_normal())
