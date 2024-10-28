extends Node


var player: Player
var player_scene = preload("res://scenes/game_objects/player/player.tscn")

func _ready():
	player = get_tree().get_first_node_in_group("player") as Player
	player.died.connect(on_player_died)
	
	
func on_player_died():
	Callable(respawn_player).call_deferred()
	

func respawn_player():
	var spawn_position = Vector2.ZERO
	var new_player_instance = player_scene.instantiate() as Player
	
	new_player_instance.global_position = spawn_position
	get_parent().add_child(new_player_instance)
	
	player.queue_free()
	player = new_player_instance
	player.died.connect(on_player_died)
	player.set_collision_active(false)
	await get_tree().create_timer(3).timeout
	player.set_collision_active(true)
	
