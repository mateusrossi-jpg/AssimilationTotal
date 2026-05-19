extends Node

@export var enemy_scene: PackedScene
@export var spawn_interval: float = 1.5
@export var max_enemies: int = 40
@export var spawn_radius: float = 900.0

var player: Node2D
var elapsed_time: float = 0.0
var spawn_timer: float = 0.0

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func _process(delta: float) -> void:
	elapsed_time += delta
	spawn_timer -= delta

	if spawn_timer > 0.0:
		return

	if get_enemy_count() >= max_enemies:
		return

	spawn_enemy()
	spawn_timer = max(0.35, spawn_interval - (elapsed_time * 0.01))

func spawn_enemy() -> void:
	if enemy_scene == null or player == null:
		return

	var enemy = enemy_scene.instantiate()
	get_tree().current_scene.add_child(enemy)

	var angle := randf() * TAU
	var direction := Vector2(cos(angle), sin(angle))
	enemy.global_position = player.global_position + (direction * spawn_radius)

func get_enemy_count() -> int:
	return get_tree().get_nodes_in_group("enemies").size()
