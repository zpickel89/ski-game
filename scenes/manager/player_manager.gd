extends Node


var player: Player
var player_scene = preload("res://scenes/game_objects/player/player.tscn")

func _ready():
	player = get_tree().get_first_node_in_group("player") as Player
	player.died.connect(on_player_died)
	
	
func on_player_died():
	var spawn_position = Vector2.ZERO
	var new_player_instance = player_scene.instantiate() as Player
	new_player_instance.global_position = spawn_position
	get_parent().add_child(new_player_instance)
	player.queue_free()
	connect_to_respawned_player(new_player_instance)
	
	
func connect_to_respawned_player(new_player: Player):
	player = new_player
	player.died.connect(on_player_died)
	
