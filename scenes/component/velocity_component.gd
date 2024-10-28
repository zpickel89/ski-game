extends Node
class_name VelocityComponent

@export var acceleration: float = 5
@export var max_speed: int = 60

var velocity = Vector2.ZERO

func acclerate_in_direction(direction: Vector2):
	var desired_velocity = direction * max_speed
	velocity = velocity.lerp(desired_velocity, 1 - exp(-acceleration * get_process_delta_time()))
	
func move(character_body: CharacterBody2D):
	character_body.velocity = velocity
	character_body.move_and_slide()
	velocity = character_body.velocity
