extends CharacterBody2D
class_name Player

signal died

@export var downward_speed: float  = 1.2

@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var collision_area_2d: Area2D = $CollisionArea2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionArea2D/CollisionShape2D


func _ready():
	collision_area_2d.body_entered.connect(on_body_entered)
	

func _process(delta: float) -> void:
	var move_vector = get_movement_vector()
	velocity_component.acclerate_in_direction(move_vector)
	velocity_component.move(self)

func set_collision_active(is_active: bool = true):
	collision_shape_2d.disabled = !is_active

func get_movement_vector():
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up") + downward_speed
	return Vector2(x_movement, y_movement)
	
	
func on_body_entered(other_body: Node2D):
	print("collision with tree!")
	died.emit()
