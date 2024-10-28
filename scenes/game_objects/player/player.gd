extends CharacterBody2D

@onready var velocity_component: VelocityComponent = $VelocityComponent


func _ready():
	pass
	

func _process(delta: float) -> void:
	var move_vector = get_movement_vector()
	velocity_component.acclerate_in_direction(move_vector)
	velocity_component.move(self)


func get_movement_vector():
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x_movement, y_movement)
